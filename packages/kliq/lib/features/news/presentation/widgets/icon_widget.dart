import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq/features/favourite/controller/favourite_controller.dart';
import 'package:kliq/features/favourite/domain/model/favourite_model.dart';
import 'package:kliq/features/news/controller/news_controller.dart';

class IconWidget extends ConsumerWidget {
  const IconWidget({
    super.key,
    required this.news,
  });
  final FavouriteNews news;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the state of favouriteController.
    final favState = ref.watch(favouriteController);

    // Default icon.
    Widget icon = const Icon(Icons.favorite_outline);

    // Check if the news ID is in the favorite list.
    favState.when(
      initial: () {},
      loading: () {},
      success: (data) {
        final containsId =
            data?.any((article) => article.uid == news.uid) ?? false;
        icon = containsId
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_outline);
      },
      error: (error) {},
    );

    return IconButton(
      icon: icon,
      onPressed: () async {
        await ref
            .read(favouriteController.notifier)
            .toggleFav(context, news: news);
      },
    );
  }
}
