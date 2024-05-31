import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq/features/favourite/controller/favourite_controller.dart';
import 'package:kliq/features/favourite/domain/model/favourite_model.dart';

class IconWidget extends ConsumerWidget {
  const IconWidget({
    super.key,
    required this.news,
  });
  final FavouriteNews news;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: const Icon(Icons.favorite),
      onPressed: () async {
        await ref.read(favouriteController.notifier).toggleFav(news: news);
        log('pressed');
      },
    );
  }
}
