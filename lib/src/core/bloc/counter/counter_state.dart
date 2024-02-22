part of 'counter_bloc.dart';

class CounterStates {
  int counter;
  CounterStates({required this.counter});
}

class InitialState extends CounterStates {
  InitialState(int initialValue) : super(counter: initialValue);
}
