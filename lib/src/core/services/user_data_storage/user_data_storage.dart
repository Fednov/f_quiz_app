import 'package:f_quiz_app/src/core/features/user/domain/entities/saved_quiz_result.dart';
import 'package:f_quiz_app/src/core/features/user/domain/entities/user.dart';
import 'package:f_quiz_app/src/core/resources/data_state.dart';

abstract class UserDataStorage {
  Future<DataState<User>> createUserData({
    required String newUserId,
    required User newUserData,
  });
  Future<DataState<bool>> deleteUserData({required String userId});
  Future<DataState<User?>> loadUserData({required String userId});
  Future<DataState<bool>> updateCurrentUserData({
    required UpdateUserDataParams updateUserDataParams,
  });
  Stream<User?> userDataChangeStream({required String userId});
}

class UpdateUserDataParams {
  UpdateUserDataParams({
    this.displayName,
    this.photoUrl,
    this.results,
    this.result,
  });

  final String? displayName;
  final String? photoUrl;
  final List<SavedQuizResult>? results;
  final SavedQuizResult? result;
}
