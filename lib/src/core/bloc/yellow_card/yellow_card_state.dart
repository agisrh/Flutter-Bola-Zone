part of 'yellow_card_bloc.dart';

abstract class YellowCardState {}

class YellowCardInitial extends YellowCardState {}

class YellowCardLoading extends YellowCardState {}

class YellowCardSuccess extends YellowCardState {
  final List<PlayerStatisticModel> listYellowCards;
  YellowCardSuccess({required this.listYellowCards});
}
