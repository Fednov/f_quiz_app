import 'package:f_quiz_app/src/core/services/auth_service/provider/auth_service_user_data_source.dart';
import 'package:f_quiz_app/src/core/services/user_data_storage/provider/user_data_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../account_repository.dart';
import '../account_repository_impl.dart';

final accountRepositoryProvider =
    Provider.autoDispose<AccountRepository>((ref) {
  var userDataStorage = ref.read(userDataStorageProvider);
  var authService = ref.read(authServiceProvider);

  return AccountRepositoryImpl(
    userDataStorage: userDataStorage,
    authService: authService,
  );
});
