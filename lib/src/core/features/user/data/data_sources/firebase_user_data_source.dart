import 'package:rxdart/rxdart.dart';
import 'package:f_quiz_app/src/core/services/auth_service/auth_service.dart';
import 'package:f_quiz_app/src/core/services/user_data_storage/user_data_storage.dart';

import '../../domain/entities/user.dart';
import '../models/user_model.dart';
import 'user_data_source.dart';

class FirebaseUserDataSource implements UserDataSource {
  FirebaseUserDataSource({
    required this.authService,
    required this.userDataStorage,
  });

  final AuthService authService;
  final UserDataStorage userDataStorage;

  final BehaviorSubject<User?> _authUserIdChangesStreamController =
      BehaviorSubject();
  final BehaviorSubject<User?> _storageUserDataChangesStreamController =
      BehaviorSubject();

  @override
  Stream<User?> currentUserStateStream() {
    return Rx.merge<User?>([
      _authUserIdChangesStream(),
      _storageUserDataChangesStream(),
    ]).distinct();
  }

  Stream<User?> _authUserIdChangesStream() {
    authService.authUserIdStream().listen((String? currentUserId) async {
      if (currentUserId == null) {
        _authUserIdChangesStreamController.add(null);
      } else {
        var userDataState =
            await userDataStorage.loadUserData(userId: currentUserId);
        var userData = userDataState.data;

        if (userData == null) {
          var createNewUserDataState = await userDataStorage.createUserData(
            newUserId: currentUserId,
            newUserData: UserModel.create(id: currentUserId).toEntity(),
          );
          var newUser = createNewUserDataState.data;
          _authUserIdChangesStreamController.add(newUser);
        }
      }
    });

    return _authUserIdChangesStreamController.stream;
  }

  Stream<User?> _storageUserDataChangesStream() {
    authService.authUserIdStream().listen((String? currentUserId) {
      if (currentUserId != null) {
        userDataStorage
            .userDataChangeStream(userId: currentUserId)
            .listen((user) {
          _storageUserDataChangesStreamController.add(user);
        });
      }
    });

    return _storageUserDataChangesStreamController.stream;
  }

  Future<void> dispose() async {
    await _authUserIdChangesStreamController.close();
    await _storageUserDataChangesStreamController.close();
  }
}
