import 'signup_status.dart';

class SignUpModel {
  final String enteredEmail;
  final String enteredPassword;
  final String enteredPasswordConfirm;
  final SignUpStatus status;
  SignUpModel({
    this.enteredEmail = '',
    this.enteredPassword = '',
    this.enteredPasswordConfirm = '',
    this.status = const SignUpStatusInit(),
  });

  SignUpModel copyWith({
    String? enteredEmail,
    String? enteredPassword,
    String? enteredPasswordConfirm,
    SignUpStatus? status,
  }) {
    return SignUpModel(
      enteredEmail: enteredEmail ?? this.enteredEmail,
      enteredPassword: enteredPassword ?? this.enteredPassword,
      enteredPasswordConfirm: enteredPasswordConfirm ?? this.enteredPasswordConfirm,
      status: status ?? this.status,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SignUpModel &&
      other.enteredEmail == enteredEmail &&
      other.enteredPassword == enteredPassword &&
      other.enteredPasswordConfirm == enteredPasswordConfirm &&
      other.status == status;
  }

  @override
  int get hashCode {
    return enteredEmail.hashCode ^
      enteredPassword.hashCode ^
      enteredPasswordConfirm.hashCode ^
      status.hashCode;
  }

  @override
  String toString() {
    return 'SignUpModel(enteredEmail: $enteredEmail, enteredPassword: $enteredPassword, enteredPasswordConfirm: $enteredPasswordConfirm, status: $status)';
  }
}
