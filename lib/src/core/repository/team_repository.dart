import 'package:bola_zone/src/core/config/network/base_response.dart';
import 'package:bola_zone/src/core/provider/team_provider.dart';

class TeamRepository {
  final teamProvider = TeamProvider();

  Future<BaseResponse> getTeams() => teamProvider.fetchTeamList();
  Future<BaseResponse> getTeamProfile(String id) => teamProvider.getTeam(id);
}
