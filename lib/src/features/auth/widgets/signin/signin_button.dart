import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view_model/provider/signin_state_provider.dart';
import '../shared/auth_base_button.dart';

class SignInButton extends ConsumerWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AuthBaseButton(
      title: 'Войти',
      onTap: () => ref.read(signInStateProvider.notifier).onSignIn(),
    );
  }
}
