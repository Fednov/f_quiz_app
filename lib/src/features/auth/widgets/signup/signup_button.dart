import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view_model/provider/signup_state_provider.dart';
import '../shared/auth_base_button.dart';

class SignUpButton extends ConsumerWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AuthBaseButton(
      title: 'Регистрация',
      onTap: () => ref.read(signUpStateProvider.notifier).onSignUp(),
    );
  }
}
