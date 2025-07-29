import 'package:f_quiz_app/src/core/utils/globals/app_globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppSystemFunctions {
  static void showSnackBar({
    required BuildContext context,
    required String content,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(content),
        ),
      );
  }

  static void showSnackBarGlobal({required String content}) {
    var context = AppGlobals.navigatorKey.currentContext;

    if (context != null) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(content),
          ),
        );
    }
  }

  static Future<void> adjustSystemUiOverlay() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }
}
