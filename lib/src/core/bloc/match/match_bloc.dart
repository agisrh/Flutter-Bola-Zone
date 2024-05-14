import 'package:bloc/bloc.dart';
import 'package:bola_zone/src/core/data/app_model.dart';
import 'package:bola_zone/src/core/data/helper_data.dart';
import 'package:bola_zone/src/core/repository/match_repository.dart';

part 'match_event.dart';
part 'match_state.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  final _matchRepo = MatchRepository();

  MatchBloc() : super(MatchInitial()) {
    on<GetMatches>((event, emit) async {
      try {
        // Last Matches
        emit(MatchLoading());
        final lastMatches =
            await _matchRepo.getLastMatches(gameweek: event.gameweek ?? '');

        // Filter data without date
        List<MatchModel> lastMatchFilter =
            lastMatches.matchList.where((i) => i.homeClub != null).toList();

        // Getting gameweek
        int gameweek = lastMatches.matchList.first.gameweek ?? 1;

        emit(MatchSuccess(
          matches: lastMatches.matchList,
          matchFilter: lastMatchFilter,
          gameWeek: gameweek,
        ));
      } catch (e) {
        MatchError(message: 'Something wrong');
      }
    });

    // Get Next Match
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
