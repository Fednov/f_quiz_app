import 'package:f_quiz_app/src/core/theme/app_dimensions.dart';
import 'package:f_quiz_app/src/core/widgets/app_animated_background_widget.dart';
import 'package:f_quiz_app/src/core/widgets/app_base_appbar.dart';
import 'package:flutter/material.dart';

import '../widgets/account_edit/edit_account_button.dart';
import '../widgets/account_edit/edit_user_name_input_field.dart';

class AccountEditScreen extends StatelessWidget {
  const AccountEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBaseAppbar(
        title: Text('Редактировать профиль'),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      body: AppAnimatedBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.mediumHorizontalPadding,
          ),
          child: Column(
            children: const [EditUserNameInputField(), EditAccountButton()]
                .map(
                  (element) => Padding(
                    padding: EdgeInsets.only(
                      top: AppDimensions.largeVerticalPadding,
                    ),
                    child: element,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
