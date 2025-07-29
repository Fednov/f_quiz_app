import 'package:f_quiz_app/src/core/widgets/app_base_animated_button.dart';
import 'package:flutter/material.dart';

class AuthBaseButton extends StatelessWidget {
  const AuthBaseButton({super.key, required this.title, required this.onTap});

  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return AppBaseAnimatedButton(
      title: title,
      titleAlignment: Alignment.center,
      color: Colors.black.withOpacity(0.5),
      onTap: onTap,
    );
  }
}
