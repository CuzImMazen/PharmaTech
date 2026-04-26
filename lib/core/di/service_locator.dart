import 'package:get_it/get_it.dart';
import 'package:pharmacy_app/core/storage/prefs/shared_prefs_service.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  //Shared Prefs

  // 1. Create the instance
  final prefsService = SharedPrefsService();

  // 2. Wait for it to be ready
  await prefsService.init();

  // 3. Register THAT specific initialized instance as a singleton
  sl.registerSingleton<SharedPrefsService>(prefsService);
}
