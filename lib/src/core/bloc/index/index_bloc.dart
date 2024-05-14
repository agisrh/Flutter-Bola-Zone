import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'index_event.dart';
part 'index_state.dart';

class IndexBloc extends Bloc<IndexEvent, IndexState> {
  IndexBloc() : super(const IndexState()) {
    on<ChangeIndexEvent>(
      (event, emit) => emit(state.copyWith(index: event.index)),
    );
  }
}
