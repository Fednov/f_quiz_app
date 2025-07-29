import 'package:f_quiz_app/src/core/widgets/app_base_input_field.dart';
import 'package:f_quiz_app/src/features/account/view_model/provider/account_controller_provider.dart';
import 'package:f_quiz_app/src/features/account/view_model/provider/account_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditUserNameInputField extends ConsumerWidget {
  const EditUserNameInputField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller =
        ref.watch(accountControllerProvider).editUserNameTextController;

    return AppBaseInputField(
      controller: controller,
      labelText: 'Имя пользователя',
      keyboardType: TextInputType.name,
      onChanged:
          ref.read(accountStateProvider.notifier).onEdittedUserNameEntering,
    );
  }
}
