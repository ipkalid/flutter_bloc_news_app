part of 'news_bloc.dart';

@immutable
sealed class NewsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class NewsFetched extends NewsEvent {}
