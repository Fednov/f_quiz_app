import 'package:f_quiz_app/src/core/features/user/domain/entities/saved_quiz_result.dart';
import 'package:f_quiz_app/src/core/services/user_data_storage/user_data_storage.dart';
import 'package:f_quiz_app/src/features/quiz/repository/quiz_repository.dart';

class QuizRepositoryImpl implements QuizRepository {
  QuizRepositoryImpl({
    required this.userDataStorage,
  });

  final UserDataStorage userDataStorage;

  @override
  Future<void> saveQuizResult({
    required String categoryTitle,
    required int numberOfCorrectAnswers,
    required int numberOfQuestions,
    required DateTime quizCompletionDate,
  }) async {
    await userDataStorage.updateCurrentUserData(
      updateUserDataParams: UpdateUserDataParams(
        result: SavedQuizResult(
          categoryTitle: categoryTitle,
          numberOfCorrectAnswers: numberOfCorrectAnswers,
          numberOfQuestions: numberOfQuestions,
          quizCompletionDate: quizCompletionDate,
        ),
      ),
    );
  }
}
