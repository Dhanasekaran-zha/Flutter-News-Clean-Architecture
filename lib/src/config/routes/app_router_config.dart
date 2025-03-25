import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_clean_architecture/src/constants/app_routes.dart';
import 'package:news_clean_architecture/src/pages/daily_news/domain/entities/ArticleEntity.dart';
import 'package:news_clean_architecture/src/pages/daily_news/presentation/screens/daily_news_screen.dart';
import 'package:news_clean_architecture/src/pages/dashboard/presentation/screens/dashboard.dart';
import 'package:news_clean_architecture/src/pages/deailed_news/presentation/screens/detailed_news.dart';

class AppRouterConfig {
  static GoRouter appRouter = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: AppRoutes.DASHBOARD,
        pageBuilder: (context, state) {
          return MaterialPage(child: Dashboard());
        },
      ),
      GoRoute(
        path: '/detailed',
        name: AppRoutes.DETAIL_SCREEN,
        pageBuilder: (context, state) {
          final ArticleEntity article = state.extra as ArticleEntity;
          return MaterialPage(child: DetailedNews(
            article:article
          ));
        },
      ),
    ],
  );

  GoRouter getRouter(){
    return appRouter;
  }
}
