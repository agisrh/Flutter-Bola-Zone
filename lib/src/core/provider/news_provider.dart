import 'package:bola_zone/src/core/export_helper.dart';
import 'package:bola_zone/src/core/config/network/base_response.dart';

class NewsProvider {
  static ApiService apiService = ApiService(Env.baseUrl());

  Future<BaseResponse> fetchNews() async {
    var response = await apiService.call(
      "news",
      method: MethodRequest.GET,
    );
    return BaseResponse.fromJson(response.data);
  }
}
