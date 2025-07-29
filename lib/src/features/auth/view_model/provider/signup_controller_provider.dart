import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../signup_controller.dart';

final signUpControllerProvider = Provider.autoDispose<SignUpController>((ref) {
  var signUpController = SignUpController();

  ref.onDispose(() => signUpController.dispose);

  return signUpController;
});
