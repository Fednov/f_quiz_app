import 'package:f_quiz_app/src/core/services/user_data_storage/provider/user_data_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../quiz_repository.dart';
import '../quiz_repository_impl.dart';

final quizRepositoryProvider = Provider<QuizRepository>((ref) {
  var userDataStorage = ref.read(userDataStorageProvider);

  return QuizRepositoryImpl(userDataStorage: userDataStorage);
});
