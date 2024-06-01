import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq/app_setup/controller/base_state.dart';
import 'package:kliq/features/news/controller/news_repo_provider.dart';
import 'package:kliq/features/news/domain/model/article_model.dart';
import 'package:kliq/features/news/domain/repo/news_repo.dart';

/// News Controller Provider
///
/// This provider is a `family` provider, which means it takes a parameter
/// (`search`) to allow dynamic creation of controllers based on the search query.
final newsSearchProvider = StateNotifierProvider.autoDispose<
    NewsSearchController, BaseState<ArticleResponse>>(
  (ref) {
    final repo = ref.watch(newsRepoProvider);
    return NewsSearchController(repo);
  },
);

/// News Search Controller
///
/// A state notifier that manages the state of fetching news articles based on
/// a search query. It extends `StateNotifier` with a state of type `BaseState<ArticleResponse>`.
///
/// The state can be:
/// - `initial`: Indicates the initial state before any action is taken.
/// - `loading`: Indicates that a fetch operation is in progress.
/// - `success`: Indicates that the fetch operation was successful and contains the fetched data.
/// - `error`: Indicates that there was an error during the fetch operation.
class NewsSearchController extends StateNotifier<BaseState<ArticleResponse>> {
  /// Constructor for NewsSearchController

  /// - `searchQuery`: The search query used to filter articles.
  NewsSearchController(this.newsRepo)
      : super(
          const BaseState<ArticleResponse>.initial(),
        );

  final NewsRepo newsRepo;

  /// Fetch Articles
  ///
  /// This method fetches articles from the repository based on the `searchQuery`.
  /// It updates the state to `loading` before starting the fetch operation.
  /// Once the fetch operation completes, it updates the state to either `success`
  /// with the fetched data, or `error` with the error message.
  Future<void> searchArticles({required String searchQuery}) async {
    state = const BaseState<ArticleResponse>.loading();
    if (searchQuery.trim().isEmpty) {
      log('data searched empty');
      final newsdata = await newsRepo.getArticles();
      newsdata.fold(
        (l) => state = BaseState<ArticleResponse>.error(l),
        (r) => state = BaseState<ArticleResponse>.success(data: r),
      );
      log('data searched empty');
      return;
    }
    final newsdata = await newsRepo.searchArticles(search: searchQuery);
    newsdata.fold(
      (l) => state = BaseState<ArticleResponse>.error(l),
      (r) => state = BaseState<ArticleResponse>.success(data: r),
    );
  }
}
