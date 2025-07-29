import 'package:f_quiz_app/src/core/routes/app_routes.dart';
import 'package:f_quiz_app/src/core/theme/app_theme.dart';
import 'package:f_quiz_app/src/core/utils/constants/app_constants_string.dart';
import 'package:f_quiz_app/src/core/utils/globals/app_globals.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FQuizApp extends StatelessWidget {
  const FQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: AppConstantsString.appTitle,
          theme: AppTheme.appLightTheme,
          debugShowCheckedModeBanner: false,
          navigatorKey: AppGlobals.navigatorKey,
          routes: AppRouter.router,
          initialRoute: AppRoutes.mainPage,
        );
      },
    );
  }
}
