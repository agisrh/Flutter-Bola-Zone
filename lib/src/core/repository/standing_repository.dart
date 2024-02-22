import 'package:bola_zone/src/core/config/network/base_response.dart';
import 'package:bola_zone/src/core/provider/standing_provider.dart';

class StandingRepository {
  final standingProvider = StandingProvider();

  Future<BaseResponse> getStandings() => standingProvider.fetchStandings();
}
