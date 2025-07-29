import 'package:f_quiz_app/src/features/account/view_model/account_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final accountControllerProvider =
    Provider.autoDispose<AccountController>((ref) {
  var accountController = AccountController();

  ref.onDispose(() => accountController.dispose());

  return accountController;
});
