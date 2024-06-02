import 'package:dio/dio.dart';
import 'package:kliq/features/news/domain/model/article_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
part 'news_client.g.dart';

/// News Client
@RestApi(baseUrl: 'https://newsdata.io/api/1/')
abstract class NewsService {
  factory NewsService(Dio dio) = _NewsService;

  @GET('latest')
  Future<ArticleResponse> getArticles(@Query('apikey') String apiKey);

  @GET('news')
  Future<ArticleResponse> searchArticle(
      @Query('apikey') String apiKey, @Query('q') String search);
}
