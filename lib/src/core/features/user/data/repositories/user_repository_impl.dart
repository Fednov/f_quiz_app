import 'package:f_quiz_app/src/core/features/user/data/data_sources/user_data_source.dart';
import 'package:f_quiz_app/src/core/features/user/domain/entities/user.dart';
import 'package:f_quiz_app/src/core/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl({
    required this.userDataSource,
  });

  final UserDataSource userDataSource;

  @override
  Stream<User?> currentUserStream() {
    return userDataSource.currentUserStateStream();
  }
}
