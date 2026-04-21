import 'package:get_it/get_it.dart';
import 'package:pharmacy_app/core/storage/prefs/shared_prefs_service.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  final prefsService = SharedPrefsService();
  await prefsService.init();

  sl.registerSingleton<SharedPrefsService>(prefsService);
}
