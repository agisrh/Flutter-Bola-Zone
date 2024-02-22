import 'package:bloc/bloc.dart';
import 'package:bola_zone/src/core/data/app_model.dart';
import 'package:bola_zone/src/core/data/helper_data.dart';
import 'package:bola_zone/src/core/repository/statistic_repository.dart';

part 'yellow_card_event.dart';
part 'yellow_card_state.dart';

class YellowCardBloc extends Bloc<YellowCardEvent, YellowCardState> {
  final _repo = StatisticRepository();

  YellowCardBloc() : super(YellowCardInitial()) {
    on<GetYellowCard>((event, emit) async {
      emit(YellowCardLoading());

      final fetchData = await _repo.getYellowCard();
      List<PlayerStatisticModel> data = fetchData.playerStatisticList;

      emit(YellowCardSuccess(listYellowCards: data));
    });
  }
}
