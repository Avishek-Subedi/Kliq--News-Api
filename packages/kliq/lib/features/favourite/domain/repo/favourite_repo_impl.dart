import 'package:kliq/app_setup/local_database/hive/hive_service.dart';
import 'package:kliq/features/favourite/domain/model/favourite_model.dart';
import 'package:kliq/features/favourite/domain/repo/favourite_repo.dart';

/// Implementation of the [FavouriteNewsRepo] interface using Hive as the database.
class FavouriteNewsRepoImpl implements FavouriteNewsRepo {
  final HiveService<FavouriteNews> hiveService;

  /// Constructs a [FavouriteNewsRepoImpl] with the provided [hiveService].
  FavouriteNewsRepoImpl(this.hiveService);

  @override
  Future<void> addFAvouriteNews({required FavouriteNews news}) async {
    try {
      await hiveService.add(news);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteNews({required int id}) async {
    try {
      await hiveService.delete(id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<FavouriteNews>> getFavouriteNews() async {
    try {
      return await hiveService.get();
    } catch (e) {
      return [];
    }
  }
}
