import 'package:f_quiz_app/src/core/resources/data_state.dart';

abstract class AuthRepository {
  Future<DataState<void>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<DataState<void>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> sendPasswordResetEmail({required String email});
}
