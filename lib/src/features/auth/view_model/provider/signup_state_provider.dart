import 'package:f_quiz_app/src/features/auth/view_model/provider/signup_controller_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/signup_model.dart';
import '../../repository/provider/auth_repository_provider.dart';
import '../signup_view_model.dart';

final signUpStateProvider =
    StateNotifierProvider.autoDispose<SignUpViewModel, SignUpModel>((ref) {
  var authRepository = ref.watch(authRepositoryProvider);
  var signUpController = ref.read(signUpControllerProvider);

  return SignUpViewModel(
    authRepository: authRepository,
    signUpController: signUpController,
  );
});
