import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kliq/app_setup/local_database/hive/hive_service.dart';
import 'package:kliq/features/favourite/domain/model/favourite_model.dart';
import 'package:kliq/features/favourite/domain/repo/favourite_repo.dart';
import 'package:kliq_components/kliq_componenets.dart';

/// Implementation of the [FavouriteNewsRepo] interface using Hive as the database.
class FavouriteNewsRepoImpl implements FavouriteNewsRepo {
  final HiveService<FavouriteNews> hiveService;

  /// Constructs a [FavouriteNewsRepoImpl] with the provided [hiveService].
  FavouriteNewsRepoImpl(this.hiveService);

  @override
  Future<void> toggleFav(BuildContext context,
      {required FavouriteNews news}) async {
    try {
      final isFav = await hiveService.getItem(news.uid!);
      log(isFav.toString());
      if (isFav != null) {
        await hiveService.delete(news.uid!);
        if (context.mounted) {
          context.showSnackBar(
              message: 'News removed from favourites', isError: false);
        }
        return;
      }
      await hiveService.putItems(
        itemKey: news.uid!,
        item: news,
      );
      if (context.mounted) {
        context.showSnackBar(
            message: 'News added to favourites', isError: false);
      }
    } catch (e, s) {
      log(s.toString());
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> deleteNews({required String uid}) async {
    try {
      await hiveService.delete(uid);
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
