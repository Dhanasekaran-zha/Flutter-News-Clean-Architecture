import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_clean_architecture/src/constants/app_routes.dart';
import 'package:news_clean_architecture/src/pages/daily_news/presentation/screens/daily_news_screen.dart';
import 'package:news_clean_architecture/src/pages/dashboard/presentation/screens/dashboard.dart';
import 'package:news_clean_architecture/src/pages/transaction/presentation/screens/transaction.dart';

class AppRouterConfig {
  static GoRouter appRouter = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: AppRoutes.DASHBOARD,
        pageBuilder: (context, state) {
          return MaterialPage(child: Transaction());
        },
      ),
      // GoRoute(
      //   path: '/',
      //   name: AppRoutes.DAILY_NEWS_SCREEN,
      //   pageBuilder: (context, state) {
      //     return MaterialPage(child: DailyNewsScreen());
      //   },
      // ),
    ],
  );

  GoRouter getRouter(){
    return appRouter;
  }
}
