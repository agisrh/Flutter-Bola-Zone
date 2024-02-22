import 'package:bloc/bloc.dart';
import 'package:bola_zone/src/core/data/app_model.dart';
import 'package:bola_zone/src/core/data/helper_data.dart';
import 'package:bola_zone/src/core/repository/statistic_repository.dart';

part 'team_goal_event.dart';
part 'team_goal_state.dart';

class TeamGoalBloc extends Bloc<TeamGoalEvent, TeamGoalState> {
  final _repo = StatisticRepository();

  TeamGoalBloc() : super(TeamGoalInitial()) {
    on<GetTeamGoal>((event, emit) async {
      emit(TeamGoalLoading());

      final fetchData = await _repo.getTeamTopGoal();
      List<TeamStatisticModel> data = fetchData.teamStatisticList;

      emit(TeamGoalSuccess(listTeamGoal: data));
    });
  }
}
