import 'package:f_quiz_app/src/core/theme/app_dimensions.dart';
import 'package:f_quiz_app/src/core/widgets/app_animated_background_widget.dart';
import 'package:flutter/material.dart';

import 'sign_in_registration_button.dart';
import 'signin_button.dart';
import 'signin_email_input_field.dart';
import 'signin_forgot_password_button.dart';
import 'signin_password_input_field.dart';

class SignInScreenBody extends StatelessWidget {
  const SignInScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppAnimatedBackground(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.mediumHorizontalPadding,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              SignInEmailInputField(),
              SignInPasswordInputField(),
              SignInButton(),
              SignInRegistrationButton(),
              SigninForgotPasswordButton(),
            ]
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.only(
                      top: AppDimensions.mediumVerticalPadding,
                    ),
                    child: e,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
