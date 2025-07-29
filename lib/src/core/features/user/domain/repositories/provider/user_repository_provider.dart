import 'package:f_quiz_app/src/core/features/user/data/data_sources/provider/user_data_source_provider.dart';
import 'package:f_quiz_app/src/core/features/user/data/repositories/user_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../user_repository.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  var userDataSource = ref.watch(userDataSourceProvider);

  return UserRepositoryImpl(userDataSource: userDataSource);
});
