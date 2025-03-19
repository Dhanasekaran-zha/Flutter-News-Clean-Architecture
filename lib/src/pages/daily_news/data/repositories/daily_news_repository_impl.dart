import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_clean_architecture/src/base/base_repository.dart';
import 'package:news_clean_architecture/src/base/data_state.dart';
import 'package:news_clean_architecture/src/constants/api_url.dart';
import 'package:news_clean_architecture/src/pages/daily_news/data/mappers/artile_list_mapper.dart';
import 'package:news_clean_architecture/src/pages/daily_news/data/services/daily_news_api_service.dart';
import 'package:news_clean_architecture/src/pages/daily_news/domain/entities/ArticleEntity.dart';
import 'package:news_clean_architecture/src/pages/daily_news/domain/repositories/daily_news_repository.dart';

class DailyNewsRepositoryImpl extends BaseRepository
    implements DailyNewsRepository {
  final DailyNewsApiService _dailyNewsApiService;

  DailyNewsRepositoryImpl(this._dailyNewsApiService);

  @override
  Future<DataState<List<ArticleEntity>>> getHeadLines(String apiKey,String country) async {
    try {
      final httpResponse = await _dailyNewsApiService.getTopHeadLines(
        apiKey: apiKey,
        country: country
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final articleList =
            httpResponse.data.articles
                .map((item) => item.toArticleEntity())
                .toList();
        return DataSuccess(articleList);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (error) {
      print(error.error);
      return DataFailed(error);
    }
  }
}
