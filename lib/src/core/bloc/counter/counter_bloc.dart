import 'package:bloc/bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  CounterBloc({int initialValue = 1}) : super(InitialState(initialValue)) {
    on<Increment>((event, emit) {
      emit(CounterStates(counter: state.counter + 1));
    });

    on<Decrement>((event, emit) {
      emit(CounterStates(counter: state.counter - 1));
    });
  }
}
