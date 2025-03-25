import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_clean_architecture/src/bloc/loader_cubit.dart';
import 'package:news_clean_architecture/src/config/routes/app_router_config.dart';
import 'package:news_clean_architecture/src/constants/app_strings.dart';
import 'package:news_clean_architecture/src/widgets/loader.dart';

import '../config/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          MaterialApp.router(
            title: AppStrings.APP_NAME,
            theme: appTheme(),
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouterConfig().getRouter(),
          ),
          Loader(),
        ],
      ),
    );
  }
}
