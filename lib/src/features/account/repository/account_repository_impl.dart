import 'package:f_quiz_app/src/core/resources/data_state.dart';
import 'package:f_quiz_app/src/core/services/auth_service/auth_service.dart';
import 'package:f_quiz_app/src/core/services/user_data_storage/user_data_storage.dart';

import 'account_repository.dart';

class AccountRepositoryImpl implements AccountRepository {
  final UserDataStorage userDataStorage;
  final AuthService authService;
  AccountRepositoryImpl({
    required this.userDataStorage,
    required this.authService,
  });

  @override
  Future<DataState<bool>> updateCurrentUserData({
    required UpdateUserDataParams updateUserDataParams,
  }) async {
    return userDataStorage.updateCurrentUserData(
      updateUserDataParams: updateUserDataParams,
    );
  }

  @override
  Future<DataState<void>> logOut() async {
    return authService.logOut();
  }
}
