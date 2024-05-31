import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kliq/features/favourite/controller/hive_provider.dart';
import 'package:kliq/features/favourite/domain/repo/favourite_repo.dart';
import 'package:kliq/features/favourite/domain/repo/favourite_repo_impl.dart';

final favouriteProvider = Provider<FavouriteNewsRepo>((ref) {
  final hiveServiceIs = ref.read(hiveService);
  return FavouriteNewsRepoImpl(hiveServiceIs);
});
