import 'package:dio/dio.dart';
import 'package:news_clean_architecture/src/base/data_state.dart';
import 'package:news_clean_architecture/src/constants/api_url.dart';
import 'package:news_clean_architecture/src/pages/daily_news/data/models/remote/top_headlines_response.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'daily_news_api_service.g.dart';

@RestApi(baseUrl: ApiUrl.BASE_URL)
abstract class DailyNewsApiService {
  factory DailyNewsApiService(Dio dio) = _DailyNewsApiService;

  @GET(ApiUrl.TOP_HEADLINES)
  Future<HttpResponse<TopHeadLinesResponse>> getTopHeadLines({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
  });
}
