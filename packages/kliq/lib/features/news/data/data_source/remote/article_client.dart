import 'package:dio/dio.dart';
import 'package:kliq/features/news/domain/model/article_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
part 'article_client.g.dart';

/// News Client
@RestApi(
    baseUrl:
        'https://newsdata.io/api/1/latest?apikey=pub_45130e2a567a68a5b05743735c98175760a27')
abstract class NewsService {
  /// Api Clieent Constructor
  factory NewsService(Dio dio) = _NewsService;

  /// Get Articles
  @GET('')
  Future<ArticleResponse> getArticles(
      // @Query('q') String? search,
      );
}
