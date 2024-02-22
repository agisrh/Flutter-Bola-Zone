part of 'red_card_bloc.dart';

abstract class RedCardState {}

// State Initial
class RedCardInitial extends RedCardState {}

class RedCardLoading extends RedCardState {}

class RedCardSuccess extends RedCardState {
  final List<PlayerStatisticModel> listRedCards;
  RedCardSuccess({required this.listRedCards});
}
