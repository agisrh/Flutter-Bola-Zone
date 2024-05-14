import 'package:bola_zone/src/core/export_helper.dart';
import 'package:bola_zone/src/core/config/network/base_response.dart';

class StandingProvider {
  static ApiService apiService = ApiService(baseUrl: Env.baseUrl());

  Future<BaseResponse> fetchStandings() async {
    var response = await apiService.call(
      "standings",
      method: MethodRequest.GET,
    );
    return BaseResponse.fromJson(response.data);
  }
}
