import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq/features/favourite/domain/model/favourite_model.dart';
import 'package:kliq/features/news/controller/news_controller.dart';
import 'package:kliq/features/news/domain/model/article_model.dart';
import 'package:kliq/features/news/presentation/widgets/icon_widget.dart';
import 'package:kliq_components/kliq_componenets.dart';

class NewsCard extends ConsumerWidget {
  const NewsCard({
    super.key,
    required this.article,
    required this.onTap,
  });
  final Article article;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 6,
          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            width: screenWidth(context),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    height: screenWidth(context) / 4,
                    width: screenWidth(context) / 3.2,
                    child: CachedNetworkImage(
                      imageUrl: article.imageUrl ?? '',
                      fit: BoxFit.cover,
                      errorWidget: (_, __, ___) => const Center(
                        child: Text('Image not found'),
                      ),
                    ),
                  ),
                ),
                HorizontalGap.m,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: textTheme(context).bodyLarge!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: colorScheme(context).onSecondary,
                            ),
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        article.description ?? '',
                        maxLines: 3,
                        style: textTheme(context).bodySmall!.copyWith(
                              fontSize: 12,
                              color: colorScheme(context).onSecondary,
                            ),
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        article.pubDate ?? '',
                        style: textTheme(context).bodySmall!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: colorScheme(context).onSecondary,
                            ),
                      )
                    ],
                  ),
                ),
                HorizontalGap.m,
                IconWidget(
                  news: FavouriteNews(
                    title: article.title,
                    imageUrl: article.imageUrl,
                    videoUrl: article.videoUrl,
                    language: article.language,
                    content: article.content,
                    description: article.description,
                    uid: article.articleId,
                    url: article.sourceUrl,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
