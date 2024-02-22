import 'package:bloc/bloc.dart';
import 'package:bola_zone/src/core/data/app_model.dart';
import 'package:bola_zone/src/core/data/helper_data.dart';
import 'package:bola_zone/src/core/repository/player_repository.dart';

part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final _repo = PlayerRepository();

  PlayerBloc() : super(PlayerInitial()) {
    on<GetPlayers>((event, emit) async {
      emit(PlayerLoading());
      final players = await _repo.getPlayers(event.teamId);
      emit(PlayerSuccess(players: players.playerList));
    });
  }
}
