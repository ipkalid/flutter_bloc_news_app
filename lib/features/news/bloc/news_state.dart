part of 'news_bloc.dart';

enum NewsStatus { initial, success, failure, loading }

class NewsState extends Equatable {
  final NewsStatus status;
  final List<NewsModel> news;
  final String error;

  const NewsState(
      {this.status = NewsStatus.initial,
      this.news = const [],
      this.error = ""});

  NewsState copyWith({
    NewsStatus? status,
    List<NewsModel>? news,
    String? error,
  }) {
    return NewsState(
      status: status ?? this.status,
      news: news ?? this.news,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, news];
}
