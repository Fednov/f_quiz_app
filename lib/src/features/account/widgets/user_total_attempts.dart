import 'package:f_quiz_app/src/core/features/user/presentation/view_model.dart/provider/current_user_provider.dart';
import 'package:f_quiz_app/src/core/utils/constants/app_constants_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'account_base_user_data_row.dart';

class UserTotalAttempts extends ConsumerWidget {
  const UserTotalAttempts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var totalAttempts = ref.watch(
      currentUserProvider.select((currentUser) => currentUser?.totalAttempts),
    );

    return AccountBaseUserDataRow(
      titleText: 'Всего попыток',
      valueText: totalAttempts ?? AppConstantsString.unknownDataNote,
    );
  }
}
