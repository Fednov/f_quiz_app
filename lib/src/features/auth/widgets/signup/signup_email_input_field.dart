import 'package:f_quiz_app/src/core/widgets/app_base_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/signup_status.dart';
import '../../view_model/provider/signup_controller_provider.dart';
import '../../view_model/provider/signup_state_provider.dart';

class SignUpEmailInputField extends ConsumerWidget {
  const SignUpEmailInputField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller =
        ref.watch(signUpControllerProvider).emailTextEditingController;

    var signUpStatus =
        ref.watch(signUpStateProvider.select((state) => state.status));

    return AppBaseInputField(
      labelText: 'Адрес электронной почты',
      controller: controller,
      autofocus: true,
      keyboardType: TextInputType.emailAddress,
      errorText:
          signUpStatus is SignUpStatusEmailError ? signUpStatus.message : null,
      onChanged: (String value) =>
          ref.read(signUpStateProvider.notifier).onEmailEntering(email: value),
      onInputFieldClear:
          ref.read(signUpStateProvider.notifier).onEnteredEmailClearing,
    );
  }
}
