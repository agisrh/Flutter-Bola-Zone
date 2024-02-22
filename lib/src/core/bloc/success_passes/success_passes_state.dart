part of 'success_passes_bloc.dart';

abstract class SuccessPassesState {}

// State Initial
class SuccessPassesInitial extends SuccessPassesState {}

// State Loaidng
class SuccessPassesLoading extends SuccessPassesState {}

// State Success
class SuccessPassesSuccess extends SuccessPassesState {
  final List<PlayerStatisticModel> listSuccessPasses;
  SuccessPassesSuccess({required this.listSuccessPasses});
}
