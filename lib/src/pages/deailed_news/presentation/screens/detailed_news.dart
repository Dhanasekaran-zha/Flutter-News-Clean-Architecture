import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_clean_architecture/src/pages/daily_news/domain/entities/ArticleEntity.dart';
import 'package:news_clean_architecture/src/widgets/themed_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailedNews extends StatefulWidget {
  final ArticleEntity article;

  const DetailedNews({super.key, required this.article});

  @override
  State<DetailedNews> createState() => _DetailedNewsState();
}

class _DetailedNewsState extends State<DetailedNews> {
  late final WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse(widget.article.url!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: themedAppBar(widget.article.title!),
      body: WebViewWidget(controller: _webViewController),
    );
  }
}
