part of 'goal_save_bloc.dart';

abstract class GoalSaveState {}

class GoalSaveInitial extends GoalSaveState {}

class GoalSaveLoading extends GoalSaveState {}

class GoalSaveSuccess extends GoalSaveState {
  final List<PlayerStatisticModel> listGoalSave;
  GoalSaveSuccess({required this.listGoalSave});
}
