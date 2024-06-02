import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq/features/news/controller/search_controller.dart';
import 'package:kliq/features/news/presentation/news_detail_screen.dart';
import 'package:kliq/features/news/presentation/widgets/news_card.dart';
import 'package:kliq/features/news/presentation/widgets/search_header.dart';
import 'package:kliq_components/kliq_componenets.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  late Debouncer _debouncer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref
          .read(newsSearchProvider.notifier)
          .searchArticles(searchQuery: '');
    });
    _debouncer = Debouncer(milliseconds: 500); // Set debounce duration
  }

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }

  void _onSearchChanged(String? value) {
    _debouncer.run(() {
      if (value != null) {
        // Trigger search in the controller
        if (value.isNotEmpty) {
          log(name: '1', value);
          ref
              .read(newsSearchProvider.notifier)
              .searchArticles(searchQuery: value);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(newsSearchProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              VerticalGap.exl,
              SearchHeader(
                isHomePage: false,
                onChanged: (value) {
                  _onSearchChanged(value);
                },
              ),
              state.maybeWhen(
                  orElse: () => const SizedBox.shrink(),
                  initial: () => const SizedBox.shrink(),
                  loading: () => SizedBox(
                        height: context.height * .6,
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                  error: (error) => Center(child: Text(error.reason)),
                  success: (data) => ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data?.results.length ?? 0,
                        itemBuilder: (context, index) {
                          return NewsCard(
                              article: data!.results[index],
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NewsDetailScreen(
                                      url: data.results[index].sourceUrl ?? '',
                                      title: data.results[index].title,
                                    ),
                                  ),
                                );
                              });
                        },
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
