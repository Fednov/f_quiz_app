import 'signin_status.dart';

class SignInModel {
  final String enteredEmail;
  final String enteredPassword;
  final SignInStatus status;
  SignInModel({
    this.enteredEmail = '',
    this.enteredPassword = '',
    this.status = const SignInStatusInit(),
  });

  SignInModel copyWith({
    String? enteredEmail,
    String? enteredPassword,
    SignInStatus? status,
  }) {
    return SignInModel(
      enteredEmail: enteredEmail ?? this.enteredEmail,
      enteredPassword: enteredPassword ?? this.enteredPassword,
      status: status ?? this.status,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignInModel &&
        other.enteredEmail == enteredEmail &&
        other.enteredPassword == enteredPassword &&
        other.status == status;
  }

  @override
  int get hashCode =>
      enteredEmail.hashCode ^ enteredPassword.hashCode ^ status.hashCode;

  @override
  String toString() =>
      'SignInModel(enteredEmail: $enteredEmail, enteredPassword: $enteredPassword, status: $status)';
}
