import 'package:f_quiz_app/src/core/routes/app_routes.dart';
import 'package:f_quiz_app/src/core/widgets/app_base_confirm_dialog.dart';
import 'package:f_quiz_app/src/core/widgets/app_base_text_button.dart';
import 'package:f_quiz_app/src/features/account/view_model/provider/account_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogOutButton extends ConsumerWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBaseTextButton(
      child: const Text('Выйти'),
      onPressed: () => showDialog<AppBaseConfirmDialog>(
        context: context,
        builder: (context) => AppBaseConfirmDialog(
          actionTitle: 'Выйти из учётной записи',
          onConfirm: () {
            ref.read(accountStateProvider.notifier).onLogOutButtonPressed();
            Navigator.of(context)
                .pushNamedAndRemoveUntil(AppRoutes.mainPage, (r) => false);
          },
        ),
      ),
    );
  }
}
