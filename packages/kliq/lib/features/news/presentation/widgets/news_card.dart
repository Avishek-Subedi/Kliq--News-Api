import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq_components/kliq_componenets.dart';

class NewsCard extends ConsumerWidget {
  const NewsCard({
    super.key,
    required this.title,
    required this.desc,
    required this.time,
    required this.imageUrl,
    required this.id,
    required this.onTap,
  });
  final String title;
  final String desc;
  final String time;
  final String imageUrl;
  final String id;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 10,
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [],

            // border: Border.all(color: Colors.blueAccent),
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
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
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
                      title,
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
                      desc,
                      maxLines: 3,
                      style: textTheme(context).bodySmall!.copyWith(
                            fontSize: 12,
                            color: colorScheme(context).onSecondary,
                          ),
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      time,
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
              const Icon(
                Icons.favorite_outline,
              )
            ],
          ),
        ),
      ),
    );
  }
}
