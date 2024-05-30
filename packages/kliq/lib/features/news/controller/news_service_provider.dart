import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq/features/news/data/data_source/remote/article_client.dart';

final newsServiceProvider = Provider<NewsService>((ref) {
  final newsService = NewsService(Dio());
  return newsService;
});
