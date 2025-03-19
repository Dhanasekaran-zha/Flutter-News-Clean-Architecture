import 'package:news_clean_architecture/src/base/data_state.dart';
import 'package:news_clean_architecture/src/pages/daily_news/domain/entities/ArticleEntity.dart';

abstract class DailyNewsRepository{
  Future<DataState<List<ArticleEntity>>> getHeadLines(String apiKey,String country);
}