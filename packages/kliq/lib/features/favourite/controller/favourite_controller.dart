import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq/app_setup/controller/base_state.dart';
import 'package:kliq/app_setup/errors/failure.dart';
import 'package:kliq/features/favourite/controller/favourite_provider.dart';
import 'package:kliq/features/favourite/domain/model/favourite_model.dart';
import 'package:kliq/features/favourite/domain/repo/favourite_repo.dart';

/// Provider for managing favorite news items
final favouriteController =
    StateNotifierProvider<FavouriteController, BaseState<List<FavouriteNews>>>(
        (ref) {
  final favNewsRepo = ref.watch(favouriteProvider);
  return FavouriteController(favNewsRepo);
});

/// Controller for managing favorite news items
class FavouriteController
    extends StateNotifier<BaseState<List<FavouriteNews>>> {
  final FavouriteNewsRepo favNewsRepo;

  /// Constructor for FavouriteController
  FavouriteController(this.favNewsRepo)
      : super(const BaseState<List<FavouriteNews>>.initial());

  /// Method to add a favorite news item
  Future<void> toggleFav(BuildContext context,
      {required FavouriteNews news}) async {
    try {
      state = const BaseState.loading();

      await favNewsRepo.toggleFav(
        context,
        news: news,
      );
      getFavourites();
      state = const BaseState<List<FavouriteNews>>.success(data: []);
    } catch (e) {
      state = BaseState.error(Failure.fromException(e));
    }
  }

  /// Method to retrieve favorite news items
  Future<void> getFavourites() async {
    try {
      state = const BaseState.loading();
      final favourites = await favNewsRepo.getFavouriteNews();
      state = BaseState<List<FavouriteNews>>.success(data: favourites);
    } catch (e) {
      state = BaseState.error(Failure(e.toString(), FailureType.exception));
    }
  }

  /// Method to delete a favorite news item by its ID
  Future<void> deleteItem({required String uid}) async {
    try {
      state = const BaseState.loading();
      await favNewsRepo.deleteNews(uid: uid);
      state = const BaseState<List<FavouriteNews>>.success(data: null);
    } catch (e) {
      state = BaseState.error(Failure(e.toString(), FailureType.exception));
    }
  }
}
