import 'package:f_quiz_app/src/core/widgets/app_base_appbar.dart';
import 'package:flutter/material.dart';

import '../widgets/main_page_screen_body.dart';
import '../widgets/to_users_personal_account_button.dart';

class MainPageScreen extends StatelessWidget {
  const MainPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBaseAppbar(
        actions: [
          ToUserPersonalAccountButton(),
        ],
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: MainPageScreenBody(),
    );
  }
}
