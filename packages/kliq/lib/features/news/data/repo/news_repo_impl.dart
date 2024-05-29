import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq/app_setup/errors/failure.dart';
import 'package:kliq/features/news/data/data_source/remote/article_client.dart';
import 'package:kliq/features/news/data/model/article_model.dart';
import 'package:kliq/features/news/data/repo/news_repo.dart';

final newsRepoProvider = Provider<NewsRepo>(
  (ref) => NewsRepoImpl(
    newsClient: NewsClient(
      Dio(),
    ),
  ),
);

class NewsRepoImpl implements NewsRepo {
  final NewsClient newsClient;
  const NewsRepoImpl({required this.newsClient});

  @override
  Future<Either<Failure, ArticleResponse>> getArticles() async {
    final data = await newsClient.getArticles();
    if (data.status == 'success') {
      return Right(data);
    }
    return Left(Failure(reason, type));
  }
}
