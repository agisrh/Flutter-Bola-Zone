import 'package:bola_zone/src/core/config/network/base_response.dart';
import 'package:bola_zone/src/core/provider/player_provider.dart';

class PlayerRepository {
  final provider = PlayerProvider();

  Future<BaseResponse> getPlayers(String teamId) =>
      provider.fetchPlayer(teamId: teamId);
}
