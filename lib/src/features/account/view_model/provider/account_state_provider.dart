import 'package:f_quiz_app/src/features/account/repository/provider/account_repository_provider.dart';
import 'package:f_quiz_app/src/features/account/view_model/provider/account_controller_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/account_model.dart';
import '../account_view_model.dart';

final accountStateProvider =
    StateNotifierProvider.autoDispose<AccountViewModel, AccountModel>((ref) {
  var accountController = ref.read(accountControllerProvider);
  var accountRepository = ref.read(accountRepositoryProvider);

  return AccountViewModel(
    accountController: accountController,
    accountRepository: accountRepository,
  );
});
