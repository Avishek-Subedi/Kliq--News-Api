import 'package:flutter/material.dart';

import 'package:kliq/app_setup/local_database/hive/hive_setup.dart';

class AppInit {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    // await Firebase.initializeApp(
    //     options: DefaultFirebaseOptions.currentPlatform);

    await HiveSetup.initHive;
  }
}
