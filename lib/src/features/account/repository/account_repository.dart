import 'package:f_quiz_app/src/core/resources/data_state.dart';
import 'package:f_quiz_app/src/core/services/user_data_storage/user_data_storage.dart';

abstract class AccountRepository {
  Future<DataState<bool>> updateCurrentUserData({
    required UpdateUserDataParams updateUserDataParams,
  });

  Future<DataState<void>> logOut();
}
