part of 'team_goal_bloc.dart';

abstract class TeamGoalState {}

// State Initial
class TeamGoalInitial extends TeamGoalState {}

// State Loaidng
class TeamGoalLoading extends TeamGoalState {}

// State Success
class TeamGoalSuccess extends TeamGoalState {
  final List<TeamStatisticModel> listTeamGoal;
  TeamGoalSuccess({required this.listTeamGoal});
}
