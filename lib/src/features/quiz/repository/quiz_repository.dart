abstract class QuizRepository {
  Future<void> saveQuizResult({
    required String categoryTitle,
    required int numberOfCorrectAnswers,
    required int numberOfQuestions,
    required DateTime quizCompletionDate,
  });
}
