import 'package:f_quiz_app/src/core/widgets/app_base_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/signin_status.dart';
import '../../view_model/provider/signin_controller_provider.dart';
import '../../view_model/provider/signin_state_provider.dart';

class SignInPasswordInputField extends ConsumerWidget {
  const SignInPasswordInputField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var signInStatus =
        ref.watch(signInStateProvider.select((state) => state.status));

    var controller =
        ref.watch(signInControllerProvider).passwordTextEditingController;

    return AppBaseInputField(
      labelText: 'Пароль',
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      errorText: signInStatus is SignInStatusPasswordError
          ? signInStatus.message
          : null,
      onChanged: (String value) => ref
          .read(signInStateProvider.notifier)
          .onPasswordEntering(password: value),
      onInputFieldClear:
          ref.read(signInStateProvider.notifier).onEnteredPasswordClearing,
    );
  }
}
