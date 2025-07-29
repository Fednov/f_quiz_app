import 'package:f_quiz_app/src/core/theme/app_dimensions.dart';
import 'package:f_quiz_app/src/core/widgets/app_animated_background_widget.dart';
import 'package:f_quiz_app/src/core/widgets/app_base_appbar.dart';
import 'package:flutter/material.dart';

import '../widgets/signin/password_recovery_button.dart';
import '../widgets/signin/password_recovery_notice_text.dart';
import '../widgets/signin/signin_email_input_field.dart';

class PasswordRecoveryScreen extends StatelessWidget {
  const PasswordRecoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBaseAppbar(
        title: Text('Восстановление пароля'),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      body: AppAnimatedBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.mediumHorizontalPadding,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: const [
                PasswordRecoveryNoticeText(),
                SignInEmailInputField(),
                PasswordRecoveryButton(),
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
      ),
    );
  }
}
