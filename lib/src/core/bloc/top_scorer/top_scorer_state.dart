part of 'top_scorer_bloc.dart';

abstract class TopScorerState {}

// State Initial
class TopScorerInitial extends TopScorerState {}

// State Loaidng
class TopScorerLoading extends TopScorerState {}

// State Success
class TopScorerSuccess extends TopScorerState {
  final List<PlayerStatisticModel> listTopScorer;
  TopScorerSuccess({required this.listTopScorer});
}
