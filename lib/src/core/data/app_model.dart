import 'package:bola_zone/src/core/config/network/base_response.dart';
import 'package:bola_zone/src/core/data/helper_data.dart';

extension AppModel on BaseResponse {
  List<TeamModel> get teamList =>
      (baseData as List).map((e) => TeamModel.fromJson(e)).toList();

  TeamModel get teamData => TeamModel.fromJson(baseData);

  List<MatchModel> get matchList =>
      (baseData as List).map((e) => MatchModel.fromJson(e)).toList();

  List<StandingModel> get standingList =>
      (baseData as List).map((e) => StandingModel.fromJson(e)).toList();

  List<PlayerStatisticModel> get playerStatisticList =>
      (baseData as List).map((e) => PlayerStatisticModel.fromJson(e)).toList();

  List<TeamStatisticModel> get teamStatisticList =>
      (baseData as List).map((e) => TeamStatisticModel.fromJson(e)).toList();

  List<PlayerModel> get playerList =>
      (baseData as List).map((e) => PlayerModel.fromJson(e)).toList();
}
