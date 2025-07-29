import 'package:f_quiz_app/src/core/resources/data_state.dart';

abstract class AuthService {
  Future<String?> get currentUserId;
  Stream<String?> authUserIdStream();
  Future<DataState<bool>> deleteCurrentUserAccount();
  Future<void> sendPasswordResetEmail({required String email});
  Future<DataState<bool>> logInWithEmaiAndPassword({
    required String email,
    required String password,
  });
  Future<DataState<bool>> logOut();
  Future<DataState<bool>> registerWithEmailAndPassword({
    required String email,
    required String password,
  });
}
