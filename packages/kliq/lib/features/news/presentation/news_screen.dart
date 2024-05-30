import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq/features/news/controller/news_controller.dart';
import 'package:kliq/features/news/domain/model/article_model.dart';
import 'package:kliq/features/news/presentation/widgets/chip_widget.dart';
import 'package:kliq/features/news/presentation/widgets/news_card.dart';
import 'package:kliq_components/kliq_componenets.dart';

class NewsScreen extends ConsumerStatefulWidget {
  const NewsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewsScreenState();
}

class _NewsScreenState extends ConsumerState<NewsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final newsState = ref.watch(newsController(''));
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        const SliverToBoxAdapter(
          child: CarouserItemWidget(
            time: '1 hr ago',
            imageUrl:
                'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2023-04/230412-russia-mobilization-mb-1056-001a41.jpg',
            title:
                'Russia set to overhaul draft system, making it nearly impossible to avoid military conscription',
            desc:
                'The changes would help the Kremlin close loopholes that have helped thousands avoid the war in Ukraine',
          ),
        ),
        SliverToBoxAdapter(
          child: NewsCard(
            onTap: () {},
            id: '1',
            time: '1 hr ago',
            imageUrl:
                'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2023-04/230412-russia-mobilization-mb-1056-001a41.jpg',
            title:
                'Russia set to overhaul draft system, making it nearly impossible to avoid military conscription',
            desc:
                'The changes would help the Kremlin close loopholes that have helped thousands avoid the war in Ukraine',
          ),
        ),
        const SliverToBoxAdapter(
          child: CategoryWidgets(),
        ),
        // SliverToBoxAdapter(child: ,),
      ],
    );
  }
}

class CategoryWidgets extends StatefulWidget {
  const CategoryWidgets({super.key});

  @override
  State<CategoryWidgets> createState() => _CategoryWidgetsState();
}

class _CategoryWidgetsState extends State<CategoryWidgets> {
  List<String> categoryItems = [
    'All',
    "Politics",
    "Natural",
    "Technology",
    "Sports",
    "Health",
    "Life"
  ];
  String selectedCategory = 'All';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: context.height * .01),
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: ListView.separated(
              itemCount: categoryItems.length,
              separatorBuilder: (context, index) => HorizontalGap.m,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(18)),
                  child: GestureDetector(
                    onTap: () {
                      selectedCategory = categoryItems[index];
                      setState(() {});
                    },
                    child: ChipWidget(
                      isSelected: selectedCategory == categoryItems[index],
                      chipText: categoryItems[index],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class CarouserItemWidget extends StatelessWidget {
  const CarouserItemWidget({
    super.key,
    required this.title,
    required this.desc,
    required this.time,
    required this.imageUrl,
  });
  final String title;
  final String desc;
  final String time;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 36,
      ),
      child: Container(
        height: context.height * .25,
        width: context.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              imageUrl,
            ),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(.6),
                Colors.black.withOpacity(.5),
                Colors.white.withOpacity(.1),
              ],
            ),
          ),
          padding: EdgeInsets.only(
            top: 16,
            bottom: 16,
            left: 16,
            right: context.width * .3,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: context.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              VerticalGap.l,
              Text(
                desc,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: context.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              VerticalGap.m,
              Text(
                time,
                style: context.textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ),
      // child: newsState.maybeWhen(
      //   initial: () => const Text('initial'),
      //   loading: () => const CircularProgressIndicator(),
      //   error: (error) => Text(error.reason),
      //   success: (newsState) => Text(
      //     newsState!.results.first.link,
      //     style: const TextStyle(color: Colors.red),
      //   ),
      //   orElse: () => const Text('or else'),
      // ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class CarosuelWidget extends StatefulWidget {
  const CarosuelWidget({
    super.key,
    required this.articles,
  });

  final List<Article> articles;

  @override
  State<CarosuelWidget> createState() => _CarosuelWidgetState();
}

class _CarosuelWidgetState extends State<CarosuelWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: widget.articles.length,
          itemBuilder: (context, index) {
            return null;

            // return CarouselItemWidget();
          }),
    );
  }
}
