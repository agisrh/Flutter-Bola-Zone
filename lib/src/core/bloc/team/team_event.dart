part of 'team_bloc.dart';

abstract class TeamEvent {}

class GetTeams extends TeamEvent {}

class GetTeamProfile extends TeamEvent {
  final String teamId;
  GetTeamProfile({required this.teamId});
}
