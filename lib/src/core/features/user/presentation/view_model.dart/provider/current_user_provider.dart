import 'package:f_quiz_app/src/core/features/user/domain/usecases/provider/current_user_state_stream_usecase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/user.dart';

import '../current_user_view_model.dart';

final currentUserProvider =
    StateNotifierProvider.autoDispose<CurrentUserViewModel, User?>((ref) {
  var currentUserStreamUseCase =
      ref.watch(currentUserStateStreamUseCaseProvider);

  return CurrentUserViewModel(
    currentUserStreamUseCase: currentUserStreamUseCase,
  );
});
