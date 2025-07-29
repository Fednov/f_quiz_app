import 'package:f_quiz_app/src/features/account/screen/account_edit_screen.dart';
import 'package:f_quiz_app/src/features/account/screen/account_screen.dart';
import 'package:f_quiz_app/src/features/auth/screen/password_recovery_screen.dart';
import 'package:f_quiz_app/src/features/auth/screen/signin_screen.dart';
import 'package:f_quiz_app/src/features/auth/screen/signup_screen.dart';
import 'package:f_quiz_app/src/features/main_page/screen/main_page_screen.dart';
import 'package:f_quiz_app/src/features/quiz/screen/quiz_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const mainPage = '/';
  static const quiz = '/quiz';
  static const authSignUp = '/auth_sign_up';
  static const authSignIn = '/auth_sign_in';
  static const authPasswordRecovery = '/auth_password_recovery';
  static const account = '/account';
  static const accountEdit = '/account_edit';
}

class AppRouter {
  static final router = {
    AppRoutes.mainPage: (BuildContext context) => const MainPageScreen(),
    AppRoutes.quiz: (BuildContext context) => const QuizScreen(),
    AppRoutes.authSignUp: (BuildContext context) => const SignUpScreen(),
    AppRoutes.authSignIn: (BuildContext context) => const SignInScreen(),
    AppRoutes.authPasswordRecovery: (BuildContext context) =>
        const PasswordRecoveryScreen(),
    AppRoutes.account: (BuildContext context) => const AccountScreen(),
    AppRoutes.accountEdit: (BuildContext context) => const AccountEditScreen(),
  };
}
