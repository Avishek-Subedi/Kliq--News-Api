import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq/features/news/controller/news_service_provider.dart';

import 'package:kliq/features/news/domain/repo/news_repo.dart';
import 'package:kliq/features/news/domain/repo/news_repo_impl.dart';

final newsRepoProvider = Provider<NewsRepo>(
  (ref) {
    final newsProvider = ref.watch(newsServiceProvider);
    return NewsRepoImpl(newsService: newsProvider);
  },
);
