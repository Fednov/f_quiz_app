import 'package:f_quiz_app/src/core/features/user/presentation/view_model.dart/provider/current_user_provider.dart';
import 'package:f_quiz_app/src/core/theme/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/provider/account_state_provider.dart';
import 'user_saved_quiz_result_row.dart';

class UserSavedQuizResultListView extends ConsumerWidget {
  const UserSavedQuizResultListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userSavedQuizResultList = ref.watch(
          currentUserProvider.select((currentUser) => currentUser?.results),
        ) ??
        [];

    var isSavedQuizResultsDisplay = ref.watch(
      accountStateProvider
          .select((acountState) => acountState.isSavedQuizResultsDisplay),
    );

    return Visibility(
      visible: isSavedQuizResultsDisplay,
      child: SingleChildScrollView(
        child: Column(
          children: userSavedQuizResultList.reversed
              .map(
                (savedQuizResult) => Padding(
                  padding: EdgeInsets.only(
                    bottom: AppDimensions.mediumVerticalPadding,
                  ),
                  child: UserSavedQuizResultRow(
                    savedQuizResult: savedQuizResult,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
