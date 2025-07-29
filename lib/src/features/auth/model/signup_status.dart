abstract class SignUpStatus {
  const SignUpStatus();
}

class SignUpStatusInit extends SignUpStatus {
  const SignUpStatusInit();
}

class SignUpStatusLoading extends SignUpStatus {
  const SignUpStatusLoading();
}

class SignUpStatusError extends SignUpStatus {
  const SignUpStatusError({
    this.message,
    this.code,
  });
  final String? message;
  final String? code;
}

class SignUpStatusSuccess extends SignUpStatus {}

class SignUpStatusEmailError extends SignUpStatusError {
  const SignUpStatusEmailError({super.message, super.code});
}

class SignUpStatusPasswordError extends SignUpStatusError {
  const SignUpStatusPasswordError({super.message, super.code});
}

class SignUpStatusPasswordConfirmError extends SignUpStatusError {
  const SignUpStatusPasswordConfirmError({super.message, super.code});
}

class SignUpStatusRemoteRequestError extends SignUpStatusError {
  const SignUpStatusRemoteRequestError({super.message, super.code});
}
