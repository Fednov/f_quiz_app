import 'package:f_quiz_app/src/core/services/auth_service/provider/auth_service_user_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../firebase_user_data_storage.dart';
import '../user_data_storage.dart';

final userDataStorageProvider = Provider<UserDataStorage>(
  (ref) {
    var authService = ref.read(authServiceProvider);

    return FirebaseUserDataStorage(authService: authService);
  },
);
