import 'package:f_quiz_app/src/core/resources/data_state.dart';
import 'package:f_quiz_app/src/core/services/auth_service/auth_service.dart';
import 'package:f_quiz_app/src/core/utils/constants/app_constants_string.dart';
import 'package:f_quiz_app/src/core/utils/system_functions/app_system_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService implements AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<String?> authUserIdStream() {
    return firebaseAuth.userChanges().asyncMap(
          (authUser) async => authUser?.uid,
        );
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (error) {
      AppSystemFunctions.showSnackBarGlobal(content: error.toString());
    }
  }

  @override
  Future<DataState<bool>> logInWithEmaiAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      if (firebaseAuth.currentUser != null) {
        return DataFailed(
          message: AppConstantsString.authFailedUserIsAllreadyLoggedIn,
        );
      }

      var userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var user = userCredential.user;

      if (user != null) {
        return DataSuccess(data: true);
      } else {
        return DataFailed(
          message: AppConstantsString.requestedUserIsMissingMessage,
        );
      }
    } catch (error) {
      AppSystemFunctions.showSnackBarGlobal(content: error.toString());
      return DataFailed(message: error.toString());
    }
  }

  @override
  Future<DataState<bool>> logOut() async {
    try {
      await firebaseAuth.signOut();

      return DataSuccess(data: true);
    } catch (error) {
      AppSystemFunctions.showSnackBarGlobal(content: error.toString());
      return DataFailed(message: error.toString());
    }
  }

  @override
  Future<DataState<bool>> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var user = userCredential.user;

      if (user != null) {
        return DataSuccess(data: true);
      } else {
        return DataFailed(
          message: AppConstantsString.requestedDataIsMissingMessage,
        );
      }
    } catch (error) {
      AppSystemFunctions.showSnackBarGlobal(content: error.toString());
      return DataFailed(message: error.toString());
    }
  }

  @override
  Future<DataState<bool>> deleteCurrentUserAccount() async {
    try {
      var user = firebaseAuth.currentUser;
      if (user != null) {
        await user.delete();

        return DataSuccess(data: true);
      } else {
        return DataFailed(
          message: AppConstantsString.requestedUserIsMissingMessage,
        );
      }
    } catch (error) {
      AppSystemFunctions.showSnackBarGlobal(content: error.toString());
      return DataFailed(message: error.toString());
    }
  }

  @override
  Future<String?> get currentUserId async {
    return firebaseAuth.currentUser?.uid;
  }
}
