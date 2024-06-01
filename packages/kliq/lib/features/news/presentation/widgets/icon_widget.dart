import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq/app/widgets/kliq_dialog.dart';
import 'package:kliq/features/auth/controllers/auth_status_provider.dart';
import 'package:kliq/features/favourite/controller/favourite_controller.dart';
import 'package:kliq/features/favourite/domain/model/favourite_model.dart';

class IconWidget extends ConsumerWidget {
  IconWidget({
    super.key,
    required this.news,
  });
  final FavouriteNews news;

  Widget icon = const Icon(Icons.favorite_outline);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStatusProvider).user;
    // Watch the state of favouriteController.
    if (user != null) {
      log('user');
      final favState = ref.watch(favouriteController);
      log(favState.toString());
      favState.when(
        initial: () {},
        loading: () => const CircularProgressIndicator(),
        success: (data) {
          final containsId =
              data?.any((article) => article.uid == news.uid) ?? false;
          icon = containsId
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_outline);
        },
        error: (error) {
          return Text(error.reason);
        },
      );
    }

    return IconButton(
      icon: user != null ? icon : const Icon(Icons.favorite_outline),
      onPressed: () async {
        if (user != null) {
          await ref
              .read(favouriteController.notifier)
              .toggleFav(context, news: news);
          return;
        }
        LogoutAlertDialogue.showLoginAlert(context);
        return;
      },
    );
  }
}
