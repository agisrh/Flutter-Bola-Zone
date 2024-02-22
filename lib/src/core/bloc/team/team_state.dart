part of 'team_bloc.dart';

abstract class TeamState {}

// State Initial
class TeamInitial extends TeamState {}

// State Loaidng
class TeamLoading extends TeamState {}

// State Success
class TeamSuccess extends TeamState {
  final List<TeamModel> teams;
  TeamSuccess({required this.teams});
}

// State Loaidng
class TeamProfileLoading extends TeamState {}

// State Success
class TeamProfileSuccess extends TeamState {
  final TeamModel team;
  TeamProfileSuccess({required this.team});
}
