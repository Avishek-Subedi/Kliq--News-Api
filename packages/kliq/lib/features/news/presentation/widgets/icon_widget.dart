import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IconWidget extends ConsumerWidget {
  const IconWidget({
    super.key,
    required this.newsId,
  });
  final String newsId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: const Icon(Icons.favorite),
      onPressed: () {
        // ref.read(newsProvider.notifier).toggleFavorite(newsId);
      },
    );
  }
}
