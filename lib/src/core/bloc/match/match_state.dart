part of 'match_bloc.dart';

abstract class MatchState {}

// State Initial
class MatchInitial extends MatchState {}

// State Loaidng
class MatchLoading extends MatchState {}

// State Success
class MatchSuccess extends MatchState {
  final List<MatchModel> matches;
  final List<MatchModel> matchFilter;
  final int? gameWeek;
  MatchSuccess(
      {required this.matches, required this.matchFilter, this.gameWeek});
}

class MatchError extends MatchState {
  MatchError({required this.message});
  final String message;
}
