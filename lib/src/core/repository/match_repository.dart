import 'package:bola_zone/src/core/config/network/base_response.dart';
import 'package:bola_zone/src/core/provider/match_provider.dart';

class MatchRepository {
  final matchProvider = MatchProvider();

  Future<BaseResponse> getLastMatches({String gameweek = ''}) =>
      matchProvider.fetchLastMatches(gameWeek: gameweek);
  Future<BaseResponse> getNextMatches() => matchProvider.fetchNextMatches();
}
