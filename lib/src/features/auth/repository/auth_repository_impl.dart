import 'package:f_quiz_app/src/core/resources/data_state.dart';
import 'package:f_quiz_app/src/core/services/auth_service/auth_service.dart';
import 'package:f_quiz_app/src/features/auth/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.authService,
  });

  final AuthService authService;

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    return authService.sendPasswordResetEmail(email: email);
  }

  @override
  Future<DataState<bool>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return authService.logInWithEmaiAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<DataState<bool>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return authService.registerWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
