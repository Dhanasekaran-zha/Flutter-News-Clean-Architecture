import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:news_clean_architecture/src/pages/daily_news/data/repositories/daily_news_repository_impl.dart';
import 'package:news_clean_architecture/src/pages/daily_news/data/services/daily_news_api_service.dart';
import 'package:news_clean_architecture/src/pages/daily_news/domain/repositories/daily_news_repository.dart';
import 'package:news_clean_architecture/src/pages/daily_news/domain/usecases/daily_news_usecase.dart';
import 'package:news_clean_architecture/src/pages/daily_news/presentation/bloc/daily_news_data_bloc.dart';

import '../bloc/loader_cubit.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final dio = Dio();
  dio.interceptors.add(
    AwesomeDioInterceptor(
      logRequestHeaders: false,
      logRequestTimeout: false,
      logResponseHeaders: false,
      // logger: debugPrint,
    ),
  );

  //common injection
  sl.registerSingleton<Dio>(dio);
  sl.registerLazySingleton<LoaderCubit>(() => LoaderCubit());


  // service injections
  sl.registerSingleton<DailyNewsApiService>(DailyNewsApiService(sl()));

  // repository injections
  sl.registerSingleton<DailyNewsRepository>(DailyNewsRepositoryImpl(sl()));

  // usecase injections
  sl.registerSingleton<DailyNewsUseCase>(DailyNewsUseCase(sl()));

  // bloc injections
  sl.registerFactory<DailyNewsDataBloc>(() => DailyNewsDataBloc(sl()));
}
