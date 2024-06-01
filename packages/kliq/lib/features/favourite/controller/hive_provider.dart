import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq/app_setup/local_database/hive/hive_const.dart';
import 'package:kliq/app_setup/local_database/hive/hive_service.dart';
import 'package:kliq/features/favourite/domain/model/favourite_model.dart';

final hiveServiceProvider = Provider<HiveService<FavouriteNews>>((ref) {
  final service = HiveService<FavouriteNews>(HIVE_FAVOURITE_BOX);
  return service;
});
