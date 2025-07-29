import 'package:f_quiz_app/src/core/routes/app_routes.dart';
import 'package:f_quiz_app/src/core/widgets/app_base_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class SigninForgotPasswordButton extends ConsumerWidget {
  const SigninForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBaseTextButton(
      onPressed: () =>
          Navigator.pushNamed(context, AppRoutes.authPasswordRecovery),
      child: const Text('Забыли пароль?'),
    );
  }
}
