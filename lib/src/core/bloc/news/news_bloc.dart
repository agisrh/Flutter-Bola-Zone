import 'package:bloc/bloc.dart';
import 'package:bola_zone/src/core/data/app_model.dart';
import 'package:bola_zone/src/core/data/helper_data.dart';
import 'package:bola_zone/src/core/repository/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final _repo = NewsRepository();

  NewsBloc() : super(NewsInitial()) {
    on<GetNews>((event, emit) async {
      try {
        emit(NewsLoading());

        final fetchData = await _repo.getNews();
        List<NewsModel> newsList = fetchData.newsList;

        emit(NewsSuccess(news: newsList));
      } catch (e) {
        emit(NewsError(message: 'Something wrong'));
      }
    });
  }
}
