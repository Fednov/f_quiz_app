import 'package:f_quiz_app/src/core/routes/app_routes.dart';
import 'package:f_quiz_app/src/core/utils/system_functions/app_system_functions.dart';
import 'package:f_quiz_app/src/core/widgets/app_base_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/signup_status.dart';
import '../view_model/provider/signup_state_provider.dart';
import '../widgets/shared/auth_progress_indicator.dart';
import '../widgets/signup/signup_screen_body.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var signUpStatus =
        ref.watch(signUpStateProvider.select((state) => state.status));

    if (signUpStatus is SignUpStatusSuccess) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.mainPage,
          (r) => false,
        ),
      );
    }

    if (signUpStatus is SignUpStatusRemoteRequestError) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => AppSystemFunctions.showSnackBar(
          context: context,
          content: signUpStatus.message ?? '',
        ),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: const AppBaseAppbar(
        title: Text(
          'Регистрация',
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          const SignUpScreenBody(),
          if (signUpStatus is SignUpStatusLoading)
            const AuthProgressIndicator(),
        ],
      ),
    );
  }
}
