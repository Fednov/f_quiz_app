import 'package:flutter/material.dart';

class AccountBaseDataTitleText extends StatelessWidget {
  const AccountBaseDataTitleText({super.key, required this.titleText});

  final String titleText;

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.bodyLarge;

    return Text(
      '$titleText:',
      style: textStyle?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
