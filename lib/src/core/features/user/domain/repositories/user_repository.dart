import '../entities/user.dart';

abstract class UserRepository {
  Stream<User?> currentUserStream();
}
