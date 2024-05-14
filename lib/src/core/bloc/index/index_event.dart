part of 'index_bloc.dart';

abstract class IndexEvent extends Equatable {
  const IndexEvent();

  @override
  List<Object> get props => [];
}

class ChangeIndexEvent extends IndexEvent {
  final int index; // declaration

  const ChangeIndexEvent({
    required this.index, // we recive the index of the navigation
  });

  @override
  List<Object> get props => [index]; // comparassion
}
