import 'package:f_quiz_app/src/core/features/questions/data/data_sources/firebase_question_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseQuestionDataSourceProvider =
    Provider<FirebaseQuestionDataSource>((ref) => FirebaseQuestionDataSource());
