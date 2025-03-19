import 'package:news_clean_architecture/src/base/data_state.dart';
import 'package:news_clean_architecture/src/base/usecase.dart';
import 'package:news_clean_architecture/src/pages/daily_news/domain/entities/ArticleEntity.dart';
import 'package:news_clean_architecture/src/pages/daily_news/domain/repositories/daily_news_repository.dart';

class DailyNewsUseCase
    implements UseCase<DataState<List<ArticleEntity>>, TopHeadLinesParams> {
  final DailyNewsRepository _dailyNewsRepository;

  DailyNewsUseCase(this._dailyNewsRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call(TopHeadLinesParams params) {
    final response = _dailyNewsRepository.getHeadLines(
      params.apiKey,
      params.country,
    );
    return response;
  }
}

class TopHeadLinesParams {
  final String apiKey;
  final String country;

  TopHeadLinesParams({required this.apiKey, required this.country});
}
