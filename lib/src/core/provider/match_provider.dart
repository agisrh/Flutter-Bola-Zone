import 'package:bola_zone/src/core/export_helper.dart';
import 'package:bola_zone/src/core/config/network/base_response.dart';

class MatchProvider {
  static ApiService apiService = ApiService(baseUrl: Env.baseUrl());

  Future<BaseResponse> fetchLastMatches({String gameWeek = ''}) async {
    var response = await apiService.call(
      "matchxday?gameweek=$gameWeek",
      method: MethodRequest.GET,
      showLog: true,
      header: {"Authorization": "Bearer xmxmxmxmmxmx"},
    );
    return BaseResponse.fromJson(response.data);
  }

  Future<BaseResponse> fetchNextMatches() async {
    var response = await apiService.call(
      "nextmatch",
      method: MethodRequest.GET,
    );
    return BaseResponse.fromJson(response.data);
  }
}
