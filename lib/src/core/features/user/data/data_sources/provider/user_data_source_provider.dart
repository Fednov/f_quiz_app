import 'package:f_quiz_app/src/core/features/user/data/data_sources/firebase_user_data_source.dart';
import 'package:f_quiz_app/src/core/services/auth_service/provider/auth_service_user_data_source.dart';
import 'package:f_quiz_app/src/core/services/user_data_storage/provider/user_data_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../user_data_source.dart';

final userDataSourceProvider = Provider.autoDispose<UserDataSource>((ref) {
  var authService = ref.read(authServiceProvider);
  var userDataStorage = ref.read(userDataStorageProvider);

  var userDataSource = FirebaseUserDataSource(
    authService: authService,
    userDataStorage: userDataStorage,
  );

  ref.onDispose(() => userDataSource.dispose());

  return userDataSource;
});
