part of 'player_bloc.dart';

abstract class PlayerEvent {}

class GetPlayers extends PlayerEvent {
  final String teamId;
  GetPlayers({required this.teamId});
}
