import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:kliq/features/auth/controllers/auth_status_provider.dart';
import 'package:kliq/features/favourite/controller/favourite_controller.dart';
import 'package:kliq/features/favourite/domain/model/favourite_model.dart';
import 'package:kliq/features/news/domain/model/article_model.dart';
import 'package:kliq/features/news/presentation/news_detail_screen.dart';
import 'package:kliq/features/news/presentation/widgets/news_card.dart';

class FavouriteScreen extends ConsumerStatefulWidget {
  const FavouriteScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FavouriteScreenState();
}

class _FavouriteScreenState extends ConsumerState<FavouriteScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref.read(favouriteController.notifier).getFavourites();
    });
  }

  @override
  Widget build(BuildContext context) {
    final favourites = ref.watch(favouriteController);
    return favourites.maybeWhen(
      orElse: () => const Center(
        child: Text('Something went wrong'),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (errorState) {
        return Center(
          child: Text(errorState.reason),
        );
      },
      success: (successState) {
        final favouriteNewsList = successState;
        if (favouriteNewsList!.isEmpty) {
          return const Center(
            child: Text('No items'),
          );
        }
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                AppBar(
                  automaticallyImplyLeading: false,
                  title: const Text(
                    'Favourites',
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: favouriteNewsList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final news = favouriteNewsList[index];
                    return NewsCard(
                      article: Article(
                        articleId: news.uid!,
                        title: news.title!,
                        link: news.url!,
                        imageUrl: news.imageUrl,
                        description: news.description,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsDetailScreen(
                              url: news.url ?? '',
                              title: news.title ?? '',
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
