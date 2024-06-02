import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:kliq/app_setup/errors/failure.dart';
import 'package:kliq/features/news/data/data_source/remote/news_client.dart';
import 'package:kliq/features/news/domain/model/article_model.dart';
import 'package:kliq/features/news/domain/repo/news_repo.dart';

/// Implementation of the News Repository Interface
///
/// This class provides the implementation for fetching news articles from a
/// remote data source. It uses the `Dio` package for network requests and
/// handles potential errors by returning them as `Failure` objects.

class NewsRepoImpl implements NewsRepo {
  final NewsService newsService;

  /// Constructor for NewsRepoImpl
  ///
  /// The `newsService` parameter is required and should be an instance of a
  /// class that implements the `NewsService` interface.
  const NewsRepoImpl({required this.newsService});

  /// Fetch Articles from the Remote Data Source
  ///
  /// This method attempts to fetch news articles using the provided `search`
  /// query. It returns a `Future` that resolves to either a `Failure` or an
  /// `ArticleResponse`.
  ///
  /// The method uses the `Either` type from the `dartz` package to represent
  /// the result. `Right` indicates a successful response, while `Left`
  /// indicates a failure.
  ///
  /// [search]: The search query to filter articles (default is an empty string).
  ///
  /// Returns a `Future<Either<Failure, ArticleResponse>>` containing the result
  /// of the network request.
  @override
  Future<Either<Failure, ArticleResponse>> getArticles() async {
    try {
      // Attempt to fetch articles using the news service
      final articles = await newsService.getArticles(
          dotenv.env['API_KEY'] ?? 'pub_45130e2a567a68a5b05743735c98175760a27');
      // Return the articles wrapped in a Right (indicating success)
      return Right(articles);
    } on DioException catch (e) {
      // If a DioException occurs, convert it to a Failure and return it
      return Left(e.toFailure);
    } catch (e) {
      // If any other exception occurs, return a generic Failure
      return Left(Failure(
        'Something went wrong',
        FailureType.unknown,
      ));
    }
  }

  /// Search news
  @override
  Future<Either<Failure, ArticleResponse>> searchArticles(
      {required String search}) async {
    try {
      // Attempt to fetch articles using the news service
      final articles = await newsService.searchArticle(
          dotenv.env['API_KEY'] ?? 'pub_45130e2a567a68a5b05743735c98175760a27',
          search);

      // Return the articles wrapped in a Right (indicating success)
      return Right(articles);
    } on DioException catch (e) {
      // If a DioException occurs, convert it to a Failure and return it
      return Left(e.toFailure);
    } catch (e) {
      // If any other exception occurs, return a generic Failure
      return Left(Failure(
        'Something went wrong',
        FailureType.unknown,
      ));
    }
  }

  @override
  Future<Either<Failure, ArticleResponse>> filterByCategory(
      {required String category}) async {
    try {
      // Attempt to fetch articles using the news service
      final articles = await newsService.searchArticle(
          dotenv.env['API_KEY'] ?? 'pub_45130e2a567a68a5b05743735c98175760a27',
          category);

      // Return the articles wrapped in a Right (indicating success)
      return Right(articles);
    } on DioException catch (e) {
      // If a DioException occurs, convert it to a Failure and return it
      return Left(e.toFailure);
    } catch (e) {
      // If any other exception occurs, return a generic Failure
      return Left(Failure(
        'Something went wrong',
        FailureType.unknown,
      ));
    }
  }
}
