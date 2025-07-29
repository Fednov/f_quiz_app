import 'package:f_quiz_app/src/core/features/user/domain/repositories/provider/user_repository_provider.dart';
import 'package:f_quiz_app/src/core/features/user/domain/usecases/current_user_state_stream.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentUserStateStreamUseCaseProvider =
    Provider<CurrentUserStateStreamUseCase>((ref) {
  var userRepository = ref.watch(userRepositoryProvider);

  return CurrentUserStateStreamUseCase(userRepository: userRepository);
});
