import 'package:f_quiz_app/src/core/resources/usecase.dart';

import '../entities/user.dart';
import '../repositories/user_repository.dart';

class CurrentUserStateStreamUseCase extends UseCase<Stream<User?>, NoParams> {
  CurrentUserStateStreamUseCase({
    required this.userRepository,
  });

  final UserRepository userRepository;

  @override
  Stream<User?> call({required NoParams params}) {
    return userRepository.currentUserStream();
  }
}
