import 'package:f_quiz_app/src/core/features/user/presentation/view_model.dart/provider/current_user_provider.dart';
import 'package:f_quiz_app/src/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToUserPersonalAccountButton extends ConsumerWidget {
  const ToUserPersonalAccountButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var currentUser = ref.watch(currentUserProvider);

    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        currentUser != null ? AppRoutes.account : AppRoutes.authSignIn,
      ),
      child: const CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Icon(Icons.account_circle),
      ),
    );
  }
}
