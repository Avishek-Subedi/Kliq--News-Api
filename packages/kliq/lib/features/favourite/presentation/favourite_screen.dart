import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq/features/favourite/controller/favourite_controller.dart';
import 'package:kliq/features/news/presentation/widgets/news_card.dart';

class FavouriteScreen extends ConsumerWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(favouriteController.notifier).getFavourites();
    final favourites = ref.watch(favouriteController);

    return favourites.maybeMap(
      orElse: () => const Center(
        child: Text('Something went wrong'),
      ),
      loading: (loadingState) => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (errorState) => Center(
        child: Text(errorState.failure.reason),
      ),
      success: (successState) {
        final favouriteNewsList = successState.data;
        return ListView.builder(
          itemCount: favouriteNewsList?.length ?? 0,
          itemBuilder: (context, index) {
            final news = favouriteNewsList?[index];
            return NewsCard(ne: news);
          },
        );
      },
    );
  }
}
