import 'package:f_quiz_app/src/core/services/user_data_storage/user_data_storage.dart';
import 'package:f_quiz_app/src/features/account/repository/account_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/account_model.dart';
import 'account_controller.dart';

class AccountViewModel extends StateNotifier<AccountModel> {
  AccountViewModel({
    required this.accountController,
    required this.accountRepository,
  }) : super(AccountModel());

  final AccountController accountController;
  final AccountRepository accountRepository;

  void onIsSavedQuizResultsDisplayButtonPressed() {
    var isSavedQuizResultsCurrentDisplay = state.isSavedQuizResultsDisplay;

    state = state.copyWith(
      isSavedQuizResultsDisplay: !isSavedQuizResultsCurrentDisplay,
    );
  }

  Future<void> onCurrentUserDataEditButtonPressed() async {
    var editedUserName = state.enteredEditedUserName.trim();

    var updateUserDataParams = UpdateUserDataParams(
      displayName: editedUserName != '' ? editedUserName : null,
    );

    await accountRepository.updateCurrentUserData(
      updateUserDataParams: updateUserDataParams,
    );
  }

  void onEdittedUserNameEntering(String userName) {
    state = state.copyWith(enteredEditedUserName: userName);
  }

  void onEnteredEdittedUserNameClearing() {
    accountController.editUserNameTextController.clear();

    state = state.copyWith(enteredEditedUserName: '');
  }

  Future<void> onLogOutButtonPressed() async {
    await accountRepository.logOut();
  }
}
