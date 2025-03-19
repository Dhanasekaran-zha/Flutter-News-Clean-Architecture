import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_clean_architecture/src/app/injection_container.dart';
import 'package:news_clean_architecture/src/constants/api_url.dart';
import 'package:news_clean_architecture/src/pages/daily_news/domain/entities/ArticleEntity.dart';
import 'package:news_clean_architecture/src/pages/daily_news/presentation/bloc/daily_news_data_bloc.dart';
import 'package:news_clean_architecture/src/pages/daily_news/presentation/bloc/daily_news_data_event.dart';
import 'package:news_clean_architecture/src/pages/daily_news/presentation/bloc/daily_news_data_state.dart';
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
        body: Center(child: _content()),
      ),
    );
  }
}

_content() {
  return BlocBuilder<DailyNewsDataBloc, DailyNewsDataState>(
    builder: (_, state) {
      if (state is DailyNewsDataStateLoading) {
        return CupertinoActivityIndicator();
      }
      if (state is DailyNewsDataStateDone) {
        return _articleList(state.articleList!);
      }
      if (state is DailyNewsDataStateError) {
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
        return _articleTile(list[index]);
      }
      return null;
    },
  );
}

_articleTile(ArticleEntity article){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image Section
        SizedBox(
          width: 100, // Adjust width as needed
          height: 100, // Keep image square or adjust
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8), // Rounded corners
            child: Image.network(
              article.urlToImage ?? "",
              fit: BoxFit.cover, // Ensures image fills the space
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.broken_image, size: 100, color: Colors.grey);
              },
            ),
          ),
        ),

        SizedBox(width: 10), // Space between image and text

        // Text Section
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title ?? "No Title Available",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis, // Prevents overflow
              ),
              SizedBox(height: 5), // Space between title and description
              Text(
                article.description ?? "No Description Available",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis, // Prevents overflow
              ),
            ],
          ),
        ),
      ],
    ),
  );

}
