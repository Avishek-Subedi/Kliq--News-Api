import 'package:flutter/material.dart';
import 'package:kliq/features/news/domain/model/article_model.dart';
import 'package:kliq_components/kliq_componenets.dart';

class CarouserItemWidget extends StatelessWidget {
  const CarouserItemWidget({super.key, required this.article});
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Container(
        width: context.width,
        height: context.height * .3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              article.imageUrl ?? '',
            ),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(.6),
                Colors.black.withOpacity(.5),
                Colors.white.withOpacity(.1),
              ],
            ),
          ),
          padding: EdgeInsets.only(
              top: 16, bottom: 16, left: 16, right: context.width * .23),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                article.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: context.textTheme.labelMedium?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              VerticalGap.s,
              Text(
                article.content ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: context.textTheme.labelSmall?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              VerticalGap.s,
              Text(
                article.pubDate ?? '',
                style: context.textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
