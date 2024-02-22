import 'package:bloc/bloc.dart';
import 'package:bola_zone/src/core/data/app_model.dart';
import 'package:bola_zone/src/core/data/helper_data.dart';
import 'package:bola_zone/src/core/repository/match_repository.dart';

part 'next_match_event.dart';
part 'next_match_state.dart';

class NextMatchBloc extends Bloc<NextMatchEvent, NextMatchState> {
  final _matchRepo = MatchRepository();

  NextMatchBloc() : super(NextMatchInitial()) {
    on<GetNextMatches>((event, emit) async {
      // Last Matches
      emit(NextMatchLoading());
      final matches = await _matchRepo.getNextMatches();

      // Filter data without date
      List<MatchModel> lastMatchFilter =
          matches.matchList.where((i) => i.homeClub != null).toList();

      emit(NextMatchSuccess(
        matches: matches.matchList,
        matchFilter: lastMatchFilter,
      ));
    });
  }
}
