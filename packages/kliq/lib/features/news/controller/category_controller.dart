import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq/app_setup/controller/base_state.dart';
import 'package:kliq/features/news/controller/news_repo_provider.dart';
import 'package:kliq/features/news/domain/model/article_model.dart';
import 'package:kliq/features/news/domain/repo/news_repo.dart';

final categoryController = StateNotifierProvider<CategoryController,
    BaseState<ArticleResponse>>((ref) {
  final repo = ref.watch(newsRepoProvider);
  return CategoryController(repo);
});

class CategoryController extends StateNotifier<BaseState<ArticleResponse>> {
  CategoryController(this.newsRepo)
      : super(
          const BaseState<ArticleResponse>.initial(),
        );
  final NewsRepo newsRepo;

  Future<void> getArticles(category) async {
    state = const BaseState<ArticleResponse>.loading();
    final newsdata = await newsRepo.filterByCategory(category: category);
    newsdata.fold(
      (l) => state = BaseState<ArticleResponse>.error(l),
      (r) => state = BaseState<ArticleResponse>.success(data: r),
    );
  }
}
