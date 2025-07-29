import 'package:f_quiz_app/src/core/extensions/datetime_formatter.dart';
import 'package:f_quiz_app/src/core/features/user/presentation/view_model.dart/provider/current_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'account_base_user_data_row.dart';

class UserRegistrationDate extends ConsumerWidget {
  const UserRegistrationDate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var registrationDate = ref.watch(
      currentUserProvider.select(
        (currentUser) =>
            currentUser?.registrationDate.toStringFormatDMYKM() ?? '',
      ),
    );

    return AccountBaseUserDataRow(
      titleText: 'Дата регистрации',
      valueText: registrationDate,
    );
  }
}
