import 'package:dartz/dartz.dart';
import 'package:kliq/app_setup/errors/failure.dart';
import 'package:kliq/features/news/data/model/article_model.dart';

/// News Repository
abstract class NewsRepo {
  /// Gets list of articles
  Future<Either<Failure, ArticleResponse>> getArticles();
}
