import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:flutter/foundation.dart';

Future<void> openGmailApp() async {
  if (Platform.isAndroid) {
    final AndroidIntent intent = AndroidIntent(
      action: 'android.intent.action.MAIN',
      category: 'android.intent.category.APP_EMAIL',
      flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
    );

    await intent.launch().catchError((e) {
      debugPrint("Could not launch intent: $e");
    });
  }
}
