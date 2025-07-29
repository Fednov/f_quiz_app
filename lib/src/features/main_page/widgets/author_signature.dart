import 'package:f_quiz_app/src/core/configs/assets/app_assets_fonts.dart';
import 'package:f_quiz_app/src/core/utils/constants/app_constants_string.dart';
import 'package:flutter/material.dart';

class AuthorSignature extends StatelessWidget {
  const AuthorSignature({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      AppConstantsString.authorName,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontFamily: AppAssetsFonts.orelegaOne,
          ),
    );
  }
}
