import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view_model/provider/signin_state_provider.dart';
import '../shared/auth_base_button.dart';

class PasswordRecoveryButton extends ConsumerWidget {
  const PasswordRecoveryButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AuthBaseButton(
      title: 'Сбросить пароль',
      onTap: ref
          .read(signInStateProvider.notifier)
          .onSendPasswordResetEmailButtonPressed,
    );
  }
}
