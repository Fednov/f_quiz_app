abstract class SignInStatus {
  const SignInStatus();
}

class SignInStatusInit extends SignInStatus {
  const SignInStatusInit();
}

class SignInStatusLoading extends SignInStatus {
  const SignInStatusLoading();
}

class SignInStatusError extends SignInStatus {
  const SignInStatusError({
    this.message,
    this.code,
  });

  final String? message;
  final String? code;
}

class SignInStatusSuccess extends SignInStatus {
  const SignInStatusSuccess();
}

class SignInStatusEmailError extends SignInStatusError {
  const SignInStatusEmailError({super.message, super.code});
}

class SignInStatusPasswordError extends SignInStatusError {
  const SignInStatusPasswordError({super.message, super.code});
}

class SignInStatusRemoteRequestError extends SignInStatusError {
  const SignInStatusRemoteRequestError({super.message, super.code});
}
