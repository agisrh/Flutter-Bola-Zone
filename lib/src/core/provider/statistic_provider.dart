import 'package:bola_zone/src/core/export_helper.dart';
import 'package:bola_zone/src/core/config/network/base_response.dart';

class StatisticProvider {
  static ApiService apiService = ApiService(baseUrl: Env.baseUrl());

  Future<BaseResponse> fetchTopScorer() async {
    var response = await apiService.call(
      "statistics/topscorer",
      method: MethodRequest.GET,
    );
    return BaseResponse.fromJson(response.data);
  }

  Future<BaseResponse> fetchRedCard() async {
    var response = await apiService.call(
      "statistics/red_card",
      method: MethodRequest.GET,
    );
    return BaseResponse.fromJson(response.data);
  }

  Future<BaseResponse> fetchYellowCard() async {
    var response = await apiService.call(
      "statistics/yellow_card",
      method: MethodRequest.GET,
    );
    return BaseResponse.fromJson(response.data);
  }

  Future<BaseResponse> fetchGoalkeeperSave() async {
    var response = await apiService.call(
      "statistics/goalkeeper_save",
      method: MethodRequest.GET,
    );
    return BaseResponse.fromJson(response.data);
  }

  Future<BaseResponse> fetchSuccessfulPasses() async {
    var response = await apiService.call(
      "statistics/successful_passes",
      method: MethodRequest.GET,
    );
    return BaseResponse.fromJson(response.data);
  }

  Future<BaseResponse> fetchTeamTopGoal() async {
    var response = await apiService.call(
      "statistics/team_top_goal",
      method: MethodRequest.GET,
    );
    return BaseResponse.fromJson(response.data);
  }
}
