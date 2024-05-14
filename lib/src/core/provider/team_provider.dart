import 'package:bola_zone/src/core/export_helper.dart';
import 'package:bola_zone/src/core/config/network/base_response.dart';

class TeamProvider {
  static ApiService apiService = ApiService(baseUrl: Env.baseUrl());

  Future<BaseResponse> fetchTeamList() async {
    var response = await apiService.call(
      "teams",
      method: MethodRequest.GET,
    );
    return BaseResponse.fromJson(response.data);
  }

  Future<BaseResponse> getTeam(String id) async {
    var response = await apiService.call(
      "team/profile/$id",
      method: MethodRequest.GET,
    );
    return BaseResponse.fromJson(response.data);
  }
}
