import 'package:flutter/material.dart';

class SignInController {
  SignInController();

  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  void dispose() {
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
  }
}
