part of 'next_match_bloc.dart';

abstract class NextMatchState {}

// State Initial
class NextMatchInitial extends NextMatchState {}

// State Loaidng
class NextMatchLoading extends NextMatchState {}

// State Success
class NextMatchSuccess extends NextMatchState {
  final List<MatchModel> matches;
  final List<MatchModel> matchFilter;
  NextMatchSuccess({required this.matches, required this.matchFilter});
}
