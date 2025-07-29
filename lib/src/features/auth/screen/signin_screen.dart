import 'package:f_quiz_app/src/core/routes/app_routes.dart';
import 'package:f_quiz_app/src/core/utils/system_functions/app_system_functions.dart';
import 'package:f_quiz_app/src/core/widgets/app_base_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/signin_status.dart';
import '../view_model/provider/signin_state_provider.dart';
import '../widgets/shared/auth_progress_indicator.dart';
import '../widgets/signin/signin_screen_body.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var signInStatus =
        ref.watch(signInStateProvider.select((state) => state.status));

    if (signInStatus is SignInStatusSuccess) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.mainPage,
          (r) => false,
        ),
      );
    }

    if (signInStatus is SignInStatusRemoteRequestError) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => AppSystemFunctions.showSnackBar(
          context: context,
          content: signInStatus.message ?? '',
        ),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: const AppBaseAppbar(
        title: Text(
          'Авторизация',
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          const SignInScreenBody(),
          if (signInStatus is SignInStatusLoading)
            const AuthProgressIndicator(),
        ],
      ),
    );
  }
}
