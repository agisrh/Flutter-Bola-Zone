import 'package:bloc/bloc.dart';
import 'package:bola_zone/src/core/data/app_model.dart';
import 'package:bola_zone/src/core/data/helper_data.dart';
import 'package:bola_zone/src/core/repository/statistic_repository.dart';

part 'top_scorer_event.dart';
part 'top_scorer_state.dart';

class TopScorerBloc extends Bloc<TopScorerEvent, TopScorerState> {
  final _repo = StatisticRepository();

  TopScorerBloc() : super(TopScorerInitial()) {
    on<GetTopScorer>((event, emit) async {
      emit(TopScorerLoading());

      final fetchData = await _repo.getTopScorer();
      List<PlayerStatisticModel> data = fetchData.playerStatisticList;

      emit(TopScorerSuccess(listTopScorer: data));
    });
  }
}
