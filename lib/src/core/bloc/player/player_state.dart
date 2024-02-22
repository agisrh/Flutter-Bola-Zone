part of 'player_bloc.dart';

abstract class PlayerState {}

// State Initial
class PlayerInitial extends PlayerState {}

// State Loaidng
class PlayerLoading extends PlayerState {}

// State Success
class PlayerSuccess extends PlayerState {
  final List<PlayerModel> players;
  PlayerSuccess({required this.players});
}
