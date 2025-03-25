import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_clean_architecture/src/app/injection_container.dart';
import 'package:news_clean_architecture/src/bloc/loader_cubit.dart';
import 'package:news_clean_architecture/src/constants/api_url.dart';
import 'package:news_clean_architecture/src/pages/daily_news/domain/entities/ArticleEntity.dart';
import 'package:news_clean_architecture/src/pages/daily_news/presentation/bloc/daily_news_data_bloc.dart';
import 'package:news_clean_architecture/src/pages/daily_news/presentation/bloc/daily_news_data_event.dart';
import 'package:news_clean_architecture/src/pages/daily_news/presentation/bloc/daily_news_data_state.dart';
import 'package:news_clean_architecture/src/widgets/article_tile.dart';
import 'package:news_clean_architecture/src/widgets/themed_app_bar.dart';

class DailyNewsScreen extends StatelessWidget {
  const DailyNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DailyNewsDataBloc>(
      create:
          (context) =>
              sl()..add(
                const GetTopHeadlines(apiKey: ApiUrl.API_KEY, country: 'us'),
              ),
      child: Scaffold(
        appBar: themedAppBar("Daily News"),
        body: Center(child: _content(context)),
      ),
    );
  }
}

_content(BuildContext context) {
  return BlocBuilder<DailyNewsDataBloc, DailyNewsDataState>(
    builder: (_, state) {
      if (state is DailyNewsDataStateLoading) {
        sl<LoaderCubit>().showLoader();
      }
      if (state is DailyNewsDataStateDone) {
        sl<LoaderCubit>().hideLoader();
        return _articleList(state.articleList!);
      }
      if (state is DailyNewsDataStateError) {
        sl<LoaderCubit>().hideLoader();
        return const Center(child: Icon(Icons.refresh));
      }
      return const SizedBox();
    },
  );
}

_articleList(List<ArticleEntity> list) {
  return ListView.builder(
    itemBuilder: (context, index) {
      if (index >= 0 && index < list.length) {
        return ArticleTile(article: list[index]);
      }
      return null;
    },
  );
}
