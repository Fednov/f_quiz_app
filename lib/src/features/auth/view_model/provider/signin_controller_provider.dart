import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../signin_controller.dart';

final signInControllerProvider = Provider.autoDispose<SignInController>((ref) {
  var signInController = SignInController();

  ref.onDispose(() => signInController.dispose());

  return signInController;
});
