import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_clean_architecture/src/bloc/loader_state.dart';

class LoaderCubit extends Cubit<LoaderState>{
  
  LoaderCubit() : super(LoaderState(false));

  void showLoader() => emit(LoaderState(true));
  void hideLoader() => emit(LoaderState(false));
}