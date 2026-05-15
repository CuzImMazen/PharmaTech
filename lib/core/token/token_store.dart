class TokenStore {
  String? _accessToken;
  String? _refreshToken;

  /// Fast access for regular request headers
  String? get accessToken => _accessToken;

  /// Fast access for the Interceptor error block when refreshing sessions
  String? get refreshToken => _refreshToken;

  /// Set both tokens after login, app startup restore, or silent refresh rotation
  void set({required String accessToken, required String refreshToken}) {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
  }

  /// Clear everything clean on logout
  void clear() {
    _accessToken = null;
    _refreshToken = null;
  }

  bool get hasToken => _accessToken != null && _accessToken!.isNotEmpty;
}
