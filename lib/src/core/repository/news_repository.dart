import 'package:bola_zone/src/core/config/network/base_response.dart';
import 'package:bola_zone/src/core/provider/news_provider.dart';

class NewsRepository {
  final provider = NewsProvider();

  Future<BaseResponse> getNews() => provider.fetchNews();
}
