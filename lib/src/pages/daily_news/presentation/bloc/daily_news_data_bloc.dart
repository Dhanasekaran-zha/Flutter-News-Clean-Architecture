import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_clean_architecture/src/base/data_state.dart';
import 'package:news_clean_architecture/src/pages/daily_news/domain/usecases/daily_news_usecase.dart';
import 'package:news_clean_architecture/src/pages/daily_news/presentation/bloc/daily_news_data_event.dart';
import 'package:news_clean_architecture/src/pages/daily_news/presentation/bloc/daily_news_data_state.dart';

class DailyNewsDataBloc extends Bloc<DailyNewsDataEvent, DailyNewsDataState> {
  final DailyNewsUseCase _dailyNewsUseCase;

  DailyNewsDataBloc(this._dailyNewsUseCase)
    : super(const DailyNewsDataStateLoading()) {
    on<GetTopHeadlines>(_onGetTopHeadlinesData);
  }

  void _onGetTopHeadlinesData(
    DailyNewsDataEvent event,
    Emitter<DailyNewsDataState> emit,
  ) async {
    if (event is GetTopHeadlines) {
      emit(DailyNewsDataStateLoading());
      final dataState = await _dailyNewsUseCase.call(
        TopHeadLinesParams(apiKey: event.apiKey, country: event.country),
      );
      if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
        emit(DailyNewsDataStateDone(dataState.data!));
      }

      if (dataState is DataFailed) {
        emit(DailyNewsDataStateError(dataState.error!));
      }
    }
  }
}
