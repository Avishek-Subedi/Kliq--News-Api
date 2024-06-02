import 'package:dartz/dartz.dart';
import 'package:kliq/app_setup/errors/failure.dart';
import 'package:kliq/features/news/domain/model/article_model.dart';

/// News Repository
abstract class NewsRepo {
  /// Gets list of articles
  Future<Either<Failure, ArticleResponse>> getArticles();
  /// GeSearch article
  Future<Either<Failure, ArticleResponse>> searchArticles({required String search});
  /// category filter
  Future<Either<Failure, ArticleResponse>> filterByCategory({required String category});
}
