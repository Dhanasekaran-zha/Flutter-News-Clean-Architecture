import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_clean_architecture/src/config/routes/app_router_config.dart';
import 'package:news_clean_architecture/src/constants/app_strings.dart';

import '../config/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.APP_NAME,
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouterConfig().getRouter(),
    );
  }

}