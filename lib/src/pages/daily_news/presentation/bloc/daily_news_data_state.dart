import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_clean_architecture/src/pages/daily_news/domain/entities/ArticleEntity.dart';

abstract class DailyNewsDataState extends Equatable {
  final List<ArticleEntity>? articleList;
  final DioException? error;

  const DailyNewsDataState({this.articleList, this.error});

  @override
  List<Object?> get props => [articleList, error];
}

class DailyNewsDataStateLoading extends DailyNewsDataState {
  const DailyNewsDataStateLoading();
}

class DailyNewsDataStateDone extends DailyNewsDataState {
  const DailyNewsDataStateDone(List<ArticleEntity> list)
    : super(articleList: list);
}

class DailyNewsDataStateError extends DailyNewsDataState {
  const DailyNewsDataStateError(DioException error) : super(error: error);
}
