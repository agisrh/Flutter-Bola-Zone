part of 'index_bloc.dart';

class IndexState extends Equatable {
  final int index;

  const IndexState({
    this.index = 0,
  });

  @override
  List<Object> get props => [index];

  IndexState copyWith({
    int? index,
  }) {
    return IndexState(
      index: index ?? this.index,
    );
  }
}
