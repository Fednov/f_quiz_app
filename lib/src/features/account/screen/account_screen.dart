import 'package:f_quiz_app/src/core/theme/app_dimensions.dart';
import 'package:f_quiz_app/src/core/widgets/app_animated_background_widget.dart';
import 'package:f_quiz_app/src/core/widgets/app_base_appbar.dart';
import 'package:f_quiz_app/src/features/account/widgets/to_account_edit_screen_button.dart';
import 'package:flutter/material.dart';

import '../widgets/is_saved_quiz_results_display_button.dart';
import '../widgets/log_out_button.dart';
import '../widgets/user_name.dart';
import '../widgets/user_percentage_of_correct_answers.dart';
import '../widgets/user_registration_date.dart';
import '../widgets/user_saved_quiz_result_listview.dart';
import '../widgets/user_total_attempts.dart';
import '../widgets/user_total_correct_answers.dart';
import '../widgets/user_total_questions_answered.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBaseAppbar(
        actions: [
          ToAccountEditScreenButton(),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: AppAnimatedBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.mediumHorizontalPadding,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: const [
                UserName(),
                Divider(),
                LogOutButton(),
                Divider(),
                UserRegistrationDate(),
                UserTotalAttempts(),
                UserTotalCorrectAnswers(),
                UserTotalQuestionsAnswered(),
                UserPercentageOfCorrectAnswers(),
                IsSavedQuizResultsDisplayButton(),
                UserSavedQuizResultListView(),
              ]
                  .map(
                    (element) => Padding(
                      padding: EdgeInsets.only(
                        bottom: AppDimensions.mediumVerticalPadding,
                      ),
                      child: element,
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
