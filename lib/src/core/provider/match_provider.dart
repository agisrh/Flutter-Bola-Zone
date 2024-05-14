import 'package:bola_zone/src/core/export_helper.dart';
import 'package:bola_zone/src/core/config/network/base_response.dart';

class MatchProvider {
  static ApiService apiService = ApiService(Env.baseUrl());

  Future<BaseResponse> fetchLastMatches({String gameWeek = ''}) async {
    var response = await apiService.call(
      "matchday?gameweek=$gameWeek",
      method: MethodRequest.GET,
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
