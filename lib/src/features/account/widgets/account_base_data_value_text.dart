import 'package:f_quiz_app/src/core/utils/constants/app_constants_string.dart';
import 'package:flutter/material.dart';

class AccountBaseDataValueText extends StatelessWidget {
  const AccountBaseDataValueText({super.key, required this.valueText});

  final String? valueText;

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.bodyLarge;

    return Text(
      valueText ?? AppConstantsString.unknownDataNote,
      style: textStyle,
      textAlign: TextAlign.center,
    );
  }
}
