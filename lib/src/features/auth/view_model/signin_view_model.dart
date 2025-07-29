import 'package:email_validator/email_validator.dart';
import 'package:f_quiz_app/src/core/resources/data_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/signin_model.dart';
import '../model/signin_status.dart';
import '../repository/auth_repository.dart';
import 'signin_controller.dart';

class SignInViewModel extends StateNotifier<SignInModel> {
  SignInViewModel({
    required this.authRepository,
    required this.signInController,
  }) : super(SignInModel());

  final AuthRepository authRepository;
  final SignInController signInController;

  Future<void> onSignIn() async {
    state = state.copyWith(status: const SignInStatusLoading());

    if (!_isEmailValid()) {
      return;
    }

    if (!_isPasswordValid()) {
      return;
    }

    var signInRequest = await authRepository.signInWithEmailAndPassword(
      email: state.enteredEmail.trim(),
      password: state.enteredPassword.trim(),
    );

    state = state.copyWith(
      status:
          _calculateSignInStatusByIncomingDataState(dataState: signInRequest),
    );
  }

  void onEmailEntering({required String? email}) {
    if (state.status is SignInStatusError) {
      _clearError();
    }

    state = state.copyWith(enteredEmail: email);
  }

  void onEnteredEmailClearing() {
    if (state.status is SignInStatusError) {
      _clearError();
    }

    signInController.emailTextEditingController.clear();
    state = state.copyWith(enteredEmail: '');
  }

  void onPasswordEntering({required String? password}) {
    if (state.status is SignInStatusError) {
      _clearError();
    }

    state = state.copyWith(enteredPassword: password);
  }

  void onEnteredPasswordClearing() {
    if (state.status is SignInStatusError) {
      _clearError();
    }

    signInController.passwordTextEditingController.clear();
    state = state.copyWith(enteredPassword: '');
  }

  Future<void> onSendPasswordResetEmailButtonPressed() async {
    if (!_isEmailValid()) {
      return;
    }

    await authRepository.sendPasswordResetEmail(
      email: state.enteredEmail.trim(),
    );
  }

  bool _isEmailValid() {
    if (state.enteredEmail.trim() == '') {
      state = state.copyWith(
        status: const SignInStatusEmailError(message: 'Введите email'),
      );

      return false;
    }

    if (!EmailValidator.validate(state.enteredEmail)) {
      state = state.copyWith(
        status: const SignInStatusEmailError(
          message: 'Некорректный адрес электронной почты',
        ),
      );
      return false;
    }

    return true;
  }

  bool _isPasswordValid() {
    if (state.enteredPassword.trim() == '') {
      state = state.copyWith(
        status: const SignInStatusPasswordError(message: 'Введите пароль'),
      );

      return false;
    }

    return true;
  }

  void _clearError() {
    state = state.copyWith(status: const SignInStatusInit());
  }

  SignInStatus _calculateSignInStatusByIncomingDataState({
    required DataState dataState,
  }) {
    switch (dataState) {
      case DataInit():
        return const SignInStatusInit();
      case DataLoading():
        return const SignInStatusLoading();
      case DataFailed():
        return SignInStatusRemoteRequestError(
          message: dataState.message,
          code: dataState.code,
        );
      case DataSuccess():
        return const SignInStatusSuccess();
      default:
        return SignInStatusRemoteRequestError(
          message: dataState.message,
          code: dataState.code,
        );
    }
  }
}
