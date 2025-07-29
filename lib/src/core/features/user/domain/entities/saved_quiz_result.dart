class SavedQuizResult {
  final String categoryTitle;
  final int numberOfCorrectAnswers;
  final int numberOfQuestions;
  final DateTime quizCompletionDate;
  SavedQuizResult({
    required this.categoryTitle,
    required this.numberOfCorrectAnswers,
    required this.numberOfQuestions,
    required this.quizCompletionDate,
  });

  SavedQuizResult copyWith({
    String? categoryTitle,
    int? numberOfCorrectAnswers,
    int? numberOfQuestions,
    DateTime? quizCompletionDate,
  }) {
    return SavedQuizResult(
      categoryTitle: categoryTitle ?? this.categoryTitle,
      numberOfCorrectAnswers:
          numberOfCorrectAnswers ?? this.numberOfCorrectAnswers,
      numberOfQuestions: numberOfQuestions ?? this.numberOfQuestions,
      quizCompletionDate: quizCompletionDate ?? this.quizCompletionDate,
    );
  }

  String get percentageOfCorrectAnswers =>
      (numberOfCorrectAnswers * 100 / numberOfQuestions).toString();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SavedQuizResult &&
        other.categoryTitle == categoryTitle &&
        other.numberOfCorrectAnswers == numberOfCorrectAnswers &&
        other.numberOfQuestions == numberOfQuestions &&
        other.quizCompletionDate == quizCompletionDate;
  }

  @override
  int get hashCode {
    return categoryTitle.hashCode ^
        numberOfCorrectAnswers.hashCode ^
        numberOfQuestions.hashCode ^
        quizCompletionDate.hashCode;
  }

  @override
  String toString() {
    return 'SavedQuizResult(categoryTitle: $categoryTitle, numberOfCorrectAnswers: $numberOfCorrectAnswers, numberOfQuestions: $numberOfQuestions, quizCompletionDate: $quizCompletionDate)';
  }
}
