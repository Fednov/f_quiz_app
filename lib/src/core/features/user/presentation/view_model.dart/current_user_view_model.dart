import 'dart:async';

import 'package:f_quiz_app/src/core/features/user/domain/usecases/current_user_state_stream.dart';
import 'package:f_quiz_app/src/core/resources/usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/user.dart';

class CurrentUserViewModel extends StateNotifier<User?> {
  CurrentUserViewModel({
    required this.currentUserStreamUseCase,
  }) : super(null) {
    currentUserStateStreamSubscription =
        currentUserStreamUseCase(params: NoParams()).listen(
      (updatedUser) => currentUserDynamicUpdate(updatedUser: updatedUser),
    );
  }

  final CurrentUserStateStreamUseCase currentUserStreamUseCase;

  late StreamSubscription<User?> currentUserStateStreamSubscription;

  void currentUserDynamicUpdate({User? updatedUser}) {
    state = updatedUser;
  }

  @override
  Future<void> dispose() async {
    await currentUserStateStreamSubscription.cancel();
    super.dispose();
  }
}
