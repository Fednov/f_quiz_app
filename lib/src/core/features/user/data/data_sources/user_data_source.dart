import '../../domain/entities/user.dart';

abstract class UserDataSource {
  Stream<User?> currentUserStateStream();
}
