import 'package:f_quiz_app/src/core/theme/app_dimensions.dart';
import 'package:f_quiz_app/src/core/widgets/app_animated_background_widget.dart';
import 'package:flutter/material.dart';

import 'signup_button.dart';
import 'signup_email_input_field.dart';
import 'signup_password_confirm_input_field.dart';
import 'signup_password_input_field.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({
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
              SignUpEmailInputField(),
              SignUpPasswordInputField(),
              SignUpPasswordConfirmInputField(),
              SignUpButton(),
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
