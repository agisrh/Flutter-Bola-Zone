part of 'standing_bloc.dart';

abstract class StandingState {}

// State Initial
class StandingInitial extends StandingState {}

// State Loaidng
class StandingLoading extends StandingState {}

// State Success
class StandingSuccess extends StandingState {
  final List<StandingModel> standings;
  StandingSuccess({required this.standings});
}

class StandingError extends StandingState {
  StandingError({required this.message});
  final String message;
}
