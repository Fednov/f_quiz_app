import 'package:f_quiz_app/src/core/widgets/app_base_progress_indicator.dart';
import 'package:flutter/material.dart';

class AuthProgressIndicator extends StatelessWidget {
  const AuthProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white.withOpacity(0.5),
        child: const Align(
          alignment: Alignment.center,
          child: AppBaseProgressIndicator(),
        ),
      ),
    );
  }
}
