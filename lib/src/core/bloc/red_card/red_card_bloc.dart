import 'package:bloc/bloc.dart';
import 'package:bola_zone/src/core/data/app_model.dart';
import 'package:bola_zone/src/core/data/helper_data.dart';
import 'package:bola_zone/src/core/repository/statistic_repository.dart';

part 'red_card_event.dart';
part 'red_card_state.dart';

class RedCardBloc extends Bloc<RedCardEvent, RedCardState> {
  final _repo = StatisticRepository();

  RedCardBloc() : super(RedCardInitial()) {
    on<GetRedCard>((event, emit) async {
      emit(RedCardLoading());

      final fetchData = await _repo.getRedCard();
      List<PlayerStatisticModel> data = fetchData.playerStatisticList;

      emit(RedCardSuccess(listRedCards: data));
    });
  }
}
