import 'package:f_quiz_app/src/core/services/auth_service/provider/auth_service_user_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth_repository.dart';
import '../auth_repository_impl.dart';

final authRepositoryProvider = Provider.autoDispose<AuthRepository>((ref) {
  var authService = ref.watch(authServiceProvider);

  return AuthRepositoryImpl(authService: authService);
});
