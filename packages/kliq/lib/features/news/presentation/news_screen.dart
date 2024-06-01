import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq/features/news/controller/news_controller.dart';
import 'package:kliq/features/news/domain/model/article_model.dart';
import 'package:kliq/features/news/presentation/news_detail_screen.dart';
import 'package:kliq/features/news/presentation/widgets/carousel_item_widget.dart';
import 'package:kliq/features/news/presentation/widgets/chip_widget.dart';
import 'package:kliq/features/news/presentation/widgets/news_card.dart';
import 'package:kliq/features/news/presentation/widgets/search_header.dart';
import 'package:kliq_components/kliq_componenets.dart';

class NewsScreen extends ConsumerStatefulWidget {
  const NewsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewsScreenState();
}

class _NewsScreenState extends ConsumerState<NewsScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    ref.read(newsController.notifier).getArticles();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    super.build(context);
    final newsState = ref.watch(newsController);
    return newsState.maybeWhen(
      orElse: () => const Center(
        child: Text('Something went wrong'),
      ),
      error: (message) => Center(
        child: Text(message.reason),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      initial: () => const SizedBox.shrink(),
      success: (data) {
        return Container(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                VerticalGap.xl,
                SearchHeader(),
                CarouselWidget(articles: data?.results ?? []),
                VerticalGap.l,
                CategoryWidgets(article: data?.results ?? []),
                VerticalGap.l,
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key, required this.articles});

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        CarouselSlider(
          items: [
            ...articles.map(
              (e) => CarouserItemWidget(
                article: e,
              ),
            ),
          ],
          //Slider Container properties
          options: CarouselOptions(
            height: 190.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 1,
          ),
        ),
      ],
    );
  }
}

class CategoryWidgets extends StatefulWidget {
  const CategoryWidgets({super.key, required this.article});
  final List<Article> article;

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
      margin: EdgeInsets.only(
        top: context.height * .01,
      ),
      child: SingleChildScrollView(
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
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.article.length,
              itemBuilder: (context, index) {
                return NewsCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailScreen(
                          url: widget.article[index].sourceUrl ?? '',
                          title: widget.article[index].title,
                        ),
                      ),
                    );
                  },
                  article: widget.article[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
