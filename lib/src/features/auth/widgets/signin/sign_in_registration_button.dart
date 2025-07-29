import 'package:f_quiz_app/src/core/routes/app_routes.dart';
import 'package:f_quiz_app/src/core/widgets/app_base_text_button.dart';
import 'package:flutter/material.dart';

class SignInRegistrationButton extends StatelessWidget {
  const SignInRegistrationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Ещё не зарегистрированы?'),
        AppBaseTextButton(
          onPressed: () => Navigator.pushNamed(
            context,
            AppRoutes.authSignUp,
          ),
          child: const Text('Регистрация'),
        ),
      ],
    );
  }
}
