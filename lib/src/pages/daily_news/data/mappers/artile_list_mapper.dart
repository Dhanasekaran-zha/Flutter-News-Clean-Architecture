import 'package:news_clean_architecture/src/pages/daily_news/data/models/remote/top_headlines_response.dart';
import 'package:news_clean_architecture/src/pages/daily_news/domain/entities/ArticleEntity.dart';

extension ArticleModelExtension on Article {
  ArticleEntity toArticleEntity() {
    return ArticleEntity(
      source: source.name,
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      content: content,
    );
  }
}
