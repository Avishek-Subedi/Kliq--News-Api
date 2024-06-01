import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kliq/app_setup/app_init/firebase_options.dart';
import 'package:kliq/app_setup/local_database/hive/hive_const.dart';
import 'package:kliq/features/favourite/domain/model/favourite_model.dart';

class AppInit {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    Hive.registerAdapter(FavouriteNewsAdapter());
    await Hive.openBox<FavouriteNews>(HIVE_FAVOURITE_BOX);
    await Hive.openBox<dynamic>("loginDetails");

    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }
}
