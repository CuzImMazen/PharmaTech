import 'package:dio/dio.dart';
import 'package:pharmacy_app/core/app/session/session_cubit.dart';
import 'package:pharmacy_app/core/di/service_locator.dart';
import 'package:pharmacy_app/core/error/api_error_handler.dart';
import 'package:pharmacy_app/core/error/app_dio_exception.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/core/network/api_routes.dart';
import 'package:pharmacy_app/core/storage/secure/secure_storage_keys.dart';
import 'package:pharmacy_app/core/storage/secure/secure_storage_service.dart';
import 'package:pharmacy_app/core/token/token_store.dart';

class AuthInterceptor extends Interceptor {
  final TokenStore _tokenStore;
  final SecureStorageService _secureStorage;
  final Dio _refreshDio;

  Future<bool>? _ongoingRefreshFuture;

  static const String _refreshPath = ApiRoutes.refresh;
  static const String _accessTokenKey = SecureStorageKeys.accessToken;
  static const String _refreshTokenKey = SecureStorageKeys.refreshToken;

  AuthInterceptor({
    required TokenStore tokenStore,
    required SecureStorageService secureStorage,
    Dio? refreshDio,
  }) : _tokenStore = tokenStore,
       _secureStorage = secureStorage,
       _refreshDio = refreshDio ?? Dio();

  // ================= REQUEST ================= //

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final skipAuth = options.extra['skipAuth'] == true;

    if (!skipAuth) {
      final accessToken = _tokenStore.accessToken;
      if (accessToken != null && accessToken.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }
    }

    options.headers['Accept-Language'] = 'en';
    handler.next(options);
  }

  // ================= ERROR ================= //

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final failure = ApiErrorHandler.handle(err);

    // Only handle 401 session expiry
    if (err.response?.statusCode == 401 && failure is SessionExpiredFailure) {
      // Prevent retry loop
      if (err.requestOptions.extra['__retried'] == true) {
        return handler.next(_toException(err, failure));
      }

      // Don't try to refresh if refresh endpoint failed
      if (err.requestOptions.path.contains(_refreshPath)) {
        await _handleLogout();
        return handler.next(_toException(err, const SessionExpiredFailure()));
      }

      final refreshToken = _tokenStore.refreshToken;
      if (refreshToken == null || refreshToken.isEmpty) {
        await _handleLogout();
        return handler.next(_toException(err, failure));
      }

      bool refreshSuccess = false;

      try {
        if (_ongoingRefreshFuture != null) {
          refreshSuccess = await _ongoingRefreshFuture!;
        } else {
          _ongoingRefreshFuture = _executeRefresh(
            refreshToken,
            err.requestOptions.baseUrl,
          );

          try {
            refreshSuccess = await _ongoingRefreshFuture!;
          } finally {
            _ongoingRefreshFuture = null;
          }
        }
      } catch (_) {
        _ongoingRefreshFuture = null;
        await _handleLogout();
        return handler.next(_toException(err, failure));
      }

      if (!refreshSuccess) {
        await _handleLogout();
        return handler.next(_toException(err, failure));
      }

      final newAccess = _tokenStore.accessToken;
      if (newAccess == null || newAccess.isEmpty) {
        await _handleLogout();
        return handler.next(_toException(err, failure));
      }

      final requestOptions = err.requestOptions;
      requestOptions.extra['__retried'] = true;
      requestOptions.headers['Authorization'] = 'Bearer $newAccess';
      if (requestOptions.data is FormData) {
        requestOptions.data = (requestOptions.data as FormData).clone();
      }

      try {
        final response = await _refreshDio.fetch(requestOptions);
        return handler.resolve(response);
      } catch (e) {
        if (e is DioException) {
          return handler.next(e);
        }
        return handler.next(_toException(err, failure));
      }
    }

    handler.next(_toException(err, failure));
  }

  // ================= REFRESH ================= //

  Future<bool> _executeRefresh(String refreshToken, String baseUrl) async {
    try {
      // final url = baseUrl.endsWith('/')
      //     ? '$baseUrl${_refreshPath.replaceFirst('/', '')}'
      //     : '$baseUrl/$_refreshPath';

      final response = await _refreshDio.post(
        "$baseUrl${ApiRoutes.refresh}",
        data: {'refresh_token': refreshToken, 'device_name': 'mobile_app'},
        options: Options(headers: {'Accept': 'application/json'}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final newAccess = response.data['access_token'];
        final newRefresh = response.data['refresh_token'];

        await _secureStorage.setString(_accessTokenKey, newAccess);
        await _secureStorage.setString(_refreshTokenKey, newRefresh);
        _tokenStore.set(accessToken: newAccess, refreshToken: newRefresh);

        return true;
      }

      return false;
    } catch (_) {
      return false;
    }
  }

  // ================= LOGOUT ================= //

  Future<void> _handleLogout() async {
    _tokenStore.clear();
    await _secureStorage.remove(_accessTokenKey);
    await _secureStorage.remove(_refreshTokenKey);

    if (sl.isRegistered<SessionCubit>()) {
      sl<SessionCubit>().setUnauthenticated();
    }
  }

  // ================= ERROR WRAPPER ================= //

  AppDioException _toException(DioException err, Failure failure) {
    return AppDioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      failure: failure,
    );
  }
}
