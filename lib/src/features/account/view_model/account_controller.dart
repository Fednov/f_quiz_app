import 'package:flutter/material.dart';

class AccountController {
  final TextEditingController editUserNameTextController =
      TextEditingController();

  void dispose() {
    editUserNameTextController.dispose();
  }
}
