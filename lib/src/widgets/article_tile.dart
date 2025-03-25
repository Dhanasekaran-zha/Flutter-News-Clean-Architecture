import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_clean_architecture/src/constants/app_routes.dart';
import 'package:news_clean_architecture/src/pages/daily_news/domain/entities/ArticleEntity.dart';

class ArticleTile extends StatefulWidget {
  final ArticleEntity article;

  const ArticleTile({super.key, required this.article});

  @override
  State<ArticleTile> createState() => _ArticleTileState();
}

class _ArticleTileState extends State<ArticleTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => GoRouter.of(
            context,
          ).pushNamed(AppRoutes.DETAIL_SCREEN, extra: widget.article),
      child: Padding(
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
                  widget.article.urlToImage ?? "",
                  fit: BoxFit.cover, // Ensures image fills the space
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.broken_image,
                      size: 100,
                      color: Colors.grey,
                    );
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
                    widget.article.title ?? "No Title Available",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis, // Prevents overflow
                  ),
                  SizedBox(height: 5), // Space between title and description
                  Text(
                    widget.article.description ?? "No Description Available",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis, // Prevents overflow
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
