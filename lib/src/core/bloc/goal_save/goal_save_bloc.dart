import 'package:bloc/bloc.dart';
import 'package:bola_zone/src/core/data/app_model.dart';
import 'package:bola_zone/src/core/data/helper_data.dart';
import 'package:bola_zone/src/core/repository/statistic_repository.dart';

part 'goal_save_event.dart';
part 'goal_save_state.dart';

class GoalSaveBloc extends Bloc<GoalSaveEvent, GoalSaveState> {
  final _repo = StatisticRepository();

  GoalSaveBloc() : super(GoalSaveInitial()) {
    on<GetGoalSave>((event, emit) async {
      emit(GoalSaveLoading());

      final fetchData = await _repo.getGoalSave();
      List<PlayerStatisticModel> data = fetchData.playerStatisticList;

      emit(GoalSaveSuccess(listGoalSave: data));
    });
  }
}
