import 'package:f_quiz_app/src/core/widgets/app_base_animated_button.dart';
import 'package:f_quiz_app/src/features/account/view_model/provider/account_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditAccountButton extends ConsumerWidget {
  const EditAccountButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBaseAnimatedButton(
      title: 'Сохранить',
      color: Colors.black.withOpacity(0.5),
      onTap: () {
        ref
            .read(accountStateProvider.notifier)
            .onCurrentUserDataEditButtonPressed();
        Navigator.of(context).pop();
      },
    );
  }
}
