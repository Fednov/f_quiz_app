import 'package:f_quiz_app/src/core/configs/assets/app_assets_fonts.dart';
import 'package:f_quiz_app/src/core/utils/constants/app_constants_string.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.0.w,
      alignment: Alignment.topCenter,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Align(
          child: Text(
            AppConstantsString.appTitle,
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(fontFamily: AppAssetsFonts.orelegaOne),
          ),
        ),
      ),
    );
  }
}
