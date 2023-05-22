import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:news/core/service_locator/service_locator.dart';
import 'package:news/features/news/models/news_model.dart';
import 'package:news/features/news/services/news_service.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final newsService = locator<NewsService>();
  NewsBloc() : super(const NewsState()) {
    on<NewsFetched>(
      _onNewsFetched,
    );
  }

  Future<void> _onNewsFetched(
    NewsFetched event,
    Emitter<NewsState> emit,
  ) async {
    try {
      if (state.status == NewsStatus.initial) {
        emit(state.copyWith(status: NewsStatus.loading));
      }
      final news = await newsService.getNews();
      emit(state.copyWith(status: NewsStatus.success, news: news));
    } catch (e) {
      emit(state.copyWith(status: NewsStatus.failure, error: e.toString()));
    }
  }
}
