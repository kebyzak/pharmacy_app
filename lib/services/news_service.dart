import 'package:pharmacy_app/models/news.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'news_service.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class NewsService {
  factory NewsService(Dio dio, {String baseUrl}) = _NewsService;

  @GET('/posts')
  Future<List<News>> getNews();
}
