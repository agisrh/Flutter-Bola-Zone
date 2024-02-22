import 'package:bola_zone/src/core/config/network/base_response.dart';
import 'package:bola_zone/src/core/provider/statistic_provider.dart';

class StatisticRepository {
  final apiProvider = StatisticProvider();

  Future<BaseResponse> getTopScorer() => apiProvider.fetchTopScorer();
  Future<BaseResponse> getRedCard() => apiProvider.fetchRedCard();
  Future<BaseResponse> getYellowCard() => apiProvider.fetchYellowCard();
  Future<BaseResponse> getGoalSave() => apiProvider.fetchGoalkeeperSave();
  Future<BaseResponse> getSuccessfulPasses() =>
      apiProvider.fetchSuccessfulPasses();
  Future<BaseResponse> getTeamTopGoal() => apiProvider.fetchTeamTopGoal();
}
