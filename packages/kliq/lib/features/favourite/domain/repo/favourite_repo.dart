import 'package:flutter/material.dart';
import 'package:kliq/features/favourite/domain/model/favourite_model.dart';

/// Abstract class for managing favorite news items.
abstract class FavouriteNewsRepo {
  /// Deletes a favorite news item with the specified [id].
  Future<void> deleteNews({required String uid});

  /// Adds a new favorite news item.
  ///
  /// The [news] parameter specifies the favorite news item to add.
  Future<void> toggleFav(BuildContext context, {required FavouriteNews news});

  /// Retrieves a list of all favorite news items.
  ///
  /// Returns a list of [FavouriteNews] objects representing favorite news items.
  Future<List<FavouriteNews>> getFavouriteNews();
}
