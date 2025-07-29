import 'package:f_quiz_app/src/core/widgets/app_base_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/signup_status.dart';
import '../../view_model/provider/signup_controller_provider.dart';
import '../../view_model/provider/signup_state_provider.dart';

class SignUpPasswordConfirmInputField extends ConsumerWidget {
  const SignUpPasswordConfirmInputField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller =
        ref.watch(signUpControllerProvider).passwordConfirmTextEditingController;

    var signUpStatus =
        ref.watch(signUpStateProvider.select((state) => state.status));

    return AppBaseInputField(
      labelText: 'Подтвердите пароль',
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      errorText: signUpStatus is SignUpStatusPasswordConfirmError
          ? signUpStatus.message
          : null,
      onChanged: (String value) => ref
          .read(signUpStateProvider.notifier)
          .onPasswordConfirmEntering(passwordConfirm: value),
      onInputFieldClear: ref
          .read(signUpStateProvider.notifier)
          .onEnteredPasswordConfirmClearing,
    );
  }
}
