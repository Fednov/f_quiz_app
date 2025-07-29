import 'package:f_quiz_app/src/core/services/auth_service/firebase_auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth_service.dart';

final authServiceProvider = Provider<AuthService>((ref) => FirebaseAuthService());
