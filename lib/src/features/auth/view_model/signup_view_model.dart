import 'package:email_validator/email_validator.dart';
import 'package:f_quiz_app/src/core/resources/data_state.dart';
import 'package:f_quiz_app/src/core/utils/constants/app_constants_num.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/signup_model.dart';
import '../model/signup_status.dart';
import '../repository/auth_repository.dart';
import 'signup_controller.dart';

class SignUpViewModel extends StateNotifier<SignUpModel> {
  SignUpViewModel({
    required this.authRepository,
    required this.signUpController,
  }) : super(SignUpModel());

  final AuthRepository authRepository;
  final SignUpController signUpController;

  Future<void> onSignUp() async {
    state = state.copyWith(status: const SignUpStatusLoading());

    if (!_isEmailValid()) {
      return;
    }
    if (!_isPasswordValid()) {
      return;
    }

    if (!_isPasswordConfirmValid()) {
      return;
    }

    var signUpRequest = await authRepository.signUpWithEmailAndPassword(
      email: state.enteredEmail.trim(),
      password: state.enteredPassword.trim(),
    );

    state = state.copyWith(
      status:
          _calculateSignUpStatusByIncomingDataState(dataState: signUpRequest),
    );
  }

  void onEmailEntering({required String email}) {
    if (state.status is SignUpStatusError) {
      _errorClear();
    }

    state = state.copyWith(
      enteredEmail: email,
    );
  }

  void onEnteredEmailClearing() {
    if (state.status is SignUpStatusError) {
      _errorClear();
    }

    signUpController.emailTextEditingController.clear();
    state = state.copyWith(enteredEmail: '');
  }

  void onPasswordEntering({required String password}) {
    if (state.status is SignUpStatusError) {
      _errorClear();
    }

    state = state.copyWith(
      enteredPassword: password,
    );
  }

  void onEnteredPasswordClearing() {
    if (state.status is SignUpStatusError) {
      _errorClear();
    }

    signUpController.passwordTextEditingController.clear();
    state = state.copyWith(enteredPassword: '');
  }

  void onPasswordConfirmEntering({required String passwordConfirm}) {
    if (state.status is SignUpStatusError) {
      _errorClear();
    }

    state = state.copyWith(
      enteredPasswordConfirm: passwordConfirm,
    );
  }

  void onEnteredPasswordConfirmClearing() {
    if (state.status is SignUpStatusError) {
      _errorClear();
    }

    signUpController.passwordConfirmTextEditingController.clear();
    state = state.copyWith(enteredPasswordConfirm: '');
  }

  bool _isEmailValid() {
    if (state.enteredEmail.trim() == '') {
      state = state.copyWith(
        status: const SignUpStatusEmailError(message: 'Введите email'),
      );

      return false;
    }

    if (!EmailValidator.validate(state.enteredEmail)) {
      state = state.copyWith(
        status: const SignUpStatusEmailError(
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
        status: const SignUpStatusPasswordError(message: 'Введите пароль'),
      );

      return false;
    }
    if (state.enteredPassword.length <
        AppConstantsNum.passwordMinimumCharactersNumber) {
      state = state.copyWith(
        status:
            const SignUpStatusPasswordError(message: 'Слишком короткий пароль'),
      );

      return false;
    }

    return true;
  }

  bool _isPasswordConfirmValid() {
    if (state.enteredPassword != state.enteredPasswordConfirm) {
      state = state.copyWith(
        status: const SignUpStatusPasswordConfirmError(
          message: 'Парои не совпадают',
        ),
      );

      return false;
    }

    return true;
  }

  void _errorClear() {
    state = state.copyWith(
      status: const SignUpStatusInit(),
    );
  }

  SignUpStatus _calculateSignUpStatusByIncomingDataState(
      {required DataState dataState}) {
    switch (dataState) {
      case DataInit():
        return const SignUpStatusInit();
      case DataLoading():
        return const SignUpStatusLoading();
      case DataFailed():
        return SignUpStatusRemoteRequestError(
          message: dataState.message,
          code: dataState.code,
        );
      case DataSuccess():
        return SignUpStatusSuccess();
      default:
        return SignUpStatusRemoteRequestError(
          message: dataState.message,
          code: dataState.code,
        );
    }
  }
}
