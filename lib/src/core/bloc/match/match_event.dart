part of 'match_bloc.dart';

abstract class MatchEvent {}

class GetMatches extends MatchEvent {
  final String? gameweek;
  GetMatches({this.gameweek});
}

class GetNextMatches extends MatchEvent {}
