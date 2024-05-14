part of 'news_bloc.dart';

abstract class NewsState {}

// State Initial
class NewsInitial extends NewsState {}

// State Loaidng
class NewsLoading extends NewsState {}

// State Success
class NewsSuccess extends NewsState {
  final List<NewsModel> news;
  NewsSuccess({required this.news});
}

class NewsError extends NewsState {
  NewsError({required this.message});
  final String message;
}
