import 'package:flutter/material.dart';

class PasswordRecoveryNoticeText extends StatelessWidget {
  const PasswordRecoveryNoticeText({super.key});

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.bodyLarge;

    return Text(
      'На указанный адрес электронной почты придёт ссылка для сброса и переустановки пароля.',
      style: textStyle,
    );
  }
}
