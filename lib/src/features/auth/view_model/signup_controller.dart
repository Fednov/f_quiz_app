import 'package:flutter/material.dart';

class SignUpController {
  SignUpController();

  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final passwordConfirmTextEditingController = TextEditingController();

  void dispose() {
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    passwordConfirmTextEditingController.dispose();
  }
}
