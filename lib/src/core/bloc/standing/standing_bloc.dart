import 'package:bloc/bloc.dart';
import 'package:bola_zone/src/core/data/app_model.dart';
import 'package:bola_zone/src/core/data/models/standing_model.dart';
import 'package:bola_zone/src/core/repository/standing_repository.dart';

part 'standing_event.dart';
part 'standing_state.dart';

class StandingBloc extends Bloc<StandingEvent, StandingState> {
  final _repo = StandingRepository();

  StandingBloc() : super(StandingInitial()) {
    on<GetStandings>((event, emit) async {
      try {
        emit(StandingLoading());

        final fetchData = await _repo.getStandings();
        List<StandingModel> standings = fetchData.standingList;

        emit(StandingSuccess(standings: standings));
      } catch (e) {
        emit(StandingError(message: 'Something wrong'));
      }
    });
  }
}
