import 'package:f_quiz_app/src/core/routes/app_routes.dart';
import 'package:f_quiz_app/src/core/widgets/app_base_icon.dart';
import 'package:flutter/material.dart';

class ToAccountEditScreenButton extends StatelessWidget {
  const ToAccountEditScreenButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.of(context).pushNamed(AppRoutes.accountEdit),
      icon: const AppBaseIcon(
        icon: Icons.edit_outlined,
      ),
    );
  }
}
