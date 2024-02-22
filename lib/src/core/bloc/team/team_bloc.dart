import 'package:bloc/bloc.dart';
import 'package:bola_zone/src/core/data/app_model.dart';
import 'package:bola_zone/src/core/data/helper_data.dart';
import 'package:bola_zone/src/core/repository/team_repository.dart';

part 'team_event.dart';
part 'team_state.dart';

class TeamBloc extends Bloc<TeamEvent, TeamState> {
  final _teamRepo = TeamRepository();

  TeamBloc() : super(TeamInitial()) {
    on<GetTeams>((event, emit) async {
      emit(TeamLoading());
      final teams = await _teamRepo.getTeams();
      emit(TeamSuccess(teams: teams.teamList));
    });

    on<GetTeamProfile>((event, emit) async {
      emit(TeamProfileLoading());
      final team = await _teamRepo.getTeamProfile(event.teamId);
      emit(TeamProfileSuccess(team: team.teamData));
    });
  }
}
