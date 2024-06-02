import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq/app_setup/controller/base_state.dart';
import 'package:kliq/features/news/controller/news_repo_provider.dart';
import 'package:kliq/features/news/domain/model/article_model.dart';
import 'package:kliq/features/news/domain/repo/news_repo.dart';

/// News Controller Provider
///
final newsController = StateNotifierProvider.autoDispose<NewsController,
    BaseState<ArticleResponse>>((ref) {
  final repo = ref.watch(newsRepoProvider);
  return NewsController(repo);
});

/// News Controller
///
/// A state notifier that manages the state of fetching news articles .
///
/// The state can be:
/// - `initial`: Indicates the initial state before any action is taken.
/// - `loading`: Indicates that a fetch operation is in progress.
/// - `success`: Indicates that the fetch operation was successful and contains the fetched data.
/// - `error`: Indicates that there was an error during the fetch operation.
class NewsController extends StateNotifier<BaseState<ArticleResponse>> {
  /// Constructor for NewsController
  ///

  /// It immediately triggers the `getArticles` method to fetch articles.
  ///
  /// - `newsRepo`: The repository used to fetch news articles.

  NewsController(this.newsRepo)
      : super(
          const BaseState<ArticleResponse>.initial(),
        ) {
    getArticles();
  }

  final NewsRepo newsRepo;

  /// Fetch Articles
  ///
  /// It updates the state to `loading` before starting the fetch operation.
  /// Once the fetch operation completes, it updates the state to either `success`
  /// with the fetched data, or `error` with the error message.
  Future<void> getArticles() async {
    state = const BaseState<ArticleResponse>.loading();
    final newsdata = await newsRepo.getArticles();
    newsdata.fold(
      (l) => state = BaseState<ArticleResponse>.error(l),
      (r) => state = BaseState<ArticleResponse>.success(data: r),
    );
  }
}
