import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f_quiz_app/src/core/features/user/data/models/saved_quiz_result_model.dart';
import 'package:f_quiz_app/src/core/features/user/data/models/user_model.dart';
import 'package:f_quiz_app/src/core/features/user/domain/entities/user.dart';
import 'package:f_quiz_app/src/core/resources/data_state.dart';
import 'package:f_quiz_app/src/core/services/auth_service/auth_service.dart';
import 'package:f_quiz_app/src/core/utils/constants/app_constants_string.dart';
import 'package:f_quiz_app/src/core/utils/system_functions/app_system_functions.dart';

import 'user_data_storage.dart';

class FirebaseUserDataStorage extends UserDataStorage {
  FirebaseUserDataStorage({
    required this.authService,
  });

  final userCollectionReference =
      FirebaseFirestore.instance.collection(AppConstantsString.userStorageName);

  final AuthService authService;

  @override
  Future<DataState<User>> createUserData({
    required String newUserId,
    required User newUserData,
  }) async {
    try {
      await userCollectionReference
          .doc(newUserId)
          .set(UserModel.fromEntity(entity: newUserData).toMap());

      return DataSuccess(data: newUserData);
    } catch (error) {
      AppSystemFunctions.showSnackBarGlobal(content: error.toString());
      return DataFailed(message: error.toString());
    }
  }

  @override
  Future<DataState<bool>> deleteUserData({required String userId}) async {
    try {
      await userCollectionReference.doc(userId).delete();

      return DataSuccess(data: true);
    } catch (error) {
      AppSystemFunctions.showSnackBarGlobal(content: error.toString());
      return DataFailed(message: error.toString());
    }
  }

  @override
  Future<DataState<User?>> loadUserData({required String userId}) async {
    try {
      var userSnapshot = await userCollectionReference.doc(userId).get();
      var userData = userSnapshot.data();

      if (userData != null) {
        return DataSuccess(
          data: UserModel.fromMap(userData).toEntity(),
        );
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
  Future<DataState<bool>> updateCurrentUserData({
    required UpdateUserDataParams updateUserDataParams,
  }) async {
    try {
      var currentUserId = await authService.currentUserId;

      if (currentUserId == null) {
        return DataFailed(
          message: AppConstantsString.authFailedUserIsNotLoggedIn,
        );
      }

      var userSnapshot = await userCollectionReference.doc(currentUserId).get();
      var userData = userSnapshot.data();

      if (userData == null) {
        return DataFailed(
          message: AppConstantsString.requestedUserIsMissingMessage,
        );
      }

      var userModel = UserModel.fromMap(userData);

      var newResult = updateUserDataParams.result;

      if (newResult != null) {
        var newResultModel = SavedQuizResultModel.fromEntity(entity: newResult);
        var updatedUserResults = <SavedQuizResultModel>[
          ...userModel.results,
          newResultModel,
        ];
        userModel = userModel.copyWith(results: updatedUserResults);
      }

      userModel = userModel.copyWith(
        name: updateUserDataParams.displayName,
        photoUrl: updateUserDataParams.photoUrl,
        results: updateUserDataParams.results
            ?.map(
              (savedQuizResult) =>
                  SavedQuizResultModel.fromEntity(entity: savedQuizResult),
            )
            .toList(),
      );

      await userCollectionReference.doc(currentUserId).set(userModel.toMap());

      return DataSuccess(data: true);
    } catch (error) {
      AppSystemFunctions.showSnackBarGlobal(
        content: error.toString(),
      );
      return DataFailed(message: error.toString());
    }
  }

  @override
  Stream<User?> userDataChangeStream({required String userId}) {
    return userCollectionReference
        .doc(userId)
        .snapshots()
        .asyncMap((userSnapshot) async {
      var userData = userSnapshot.data();
      if (userData == null) {
        return null;
      }

      return UserModel.fromMap(userData).toEntity();
    });
  }
}
