import 'package:bola_zone/src/core/export_helper.dart';
import 'package:bola_zone/src/core/config/network/base_response.dart';

class PlayerProvider {
  static ApiService apiService = ApiService(baseUrl: Env.baseUrl());

  Future<BaseResponse> fetchPlayer({required String teamId}) async {
    var response = await apiService.call(
      "team/players/$teamId",
      method: MethodRequest.GET,
    );
    return BaseResponse.fromJson(response.data);
  }
}
