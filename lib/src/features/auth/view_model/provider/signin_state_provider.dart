import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/signin_model.dart';
import '../../repository/provider/auth_repository_provider.dart';
import '../signin_view_model.dart';
import 'signin_controller_provider.dart';

final signInStateProvider =
    StateNotifierProvider.autoDispose<SignInViewModel, SignInModel>((ref) {
  var authRepository = ref.watch(authRepositoryProvider);
  var signInController = ref.read(signInControllerProvider);

  return SignInViewModel(
    authRepository: authRepository,
    signInController: signInController,
  );
});
