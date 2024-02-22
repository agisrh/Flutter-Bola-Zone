import 'package:bloc/bloc.dart';
import 'package:bola_zone/src/core/data/app_model.dart';
import 'package:bola_zone/src/core/data/helper_data.dart';
import 'package:bola_zone/src/core/repository/statistic_repository.dart';

part 'success_passes_event.dart';
part 'success_passes_state.dart';

class SuccessPassesBloc extends Bloc<SuccessPassesEvent, SuccessPassesState> {
  final _repo = StatisticRepository();

  SuccessPassesBloc() : super(SuccessPassesInitial()) {
    on<GetSuccessPasses>((event, emit) async {
      emit(SuccessPassesLoading());

      final fetchData = await _repo.getSuccessfulPasses();
      List<PlayerStatisticModel> data = fetchData.playerStatisticList;

      emit(SuccessPassesSuccess(listSuccessPasses: data));
    });
  }
}
