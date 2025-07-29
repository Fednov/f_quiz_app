import 'dart:convert';

import 'package:f_quiz_app/src/core/resources/model.dart';

import '../../domain/entities/saved_quiz_result.dart';

class SavedQuizResultModel implements Model<SavedQuizResult> {
  final String categoryTitle;
  final int numberOfCorrectAnswers;
  final int numberOfQuestions;
  final DateTime quizCompletionDate;
  SavedQuizResultModel({
    required this.categoryTitle,
    required this.numberOfCorrectAnswers,
    required this.numberOfQuestions,
    required this.quizCompletionDate,
  });

  factory SavedQuizResultModel.fromEntity({required SavedQuizResult entity}) {
    return SavedQuizResultModel(
      categoryTitle: entity.categoryTitle,
      numberOfCorrectAnswers: entity.numberOfCorrectAnswers,
      numberOfQuestions: entity.numberOfQuestions,
      quizCompletionDate: entity.quizCompletionDate,
    );
  }

  @override
  SavedQuizResult toEntity() {
    return SavedQuizResult(
      categoryTitle: categoryTitle,
      numberOfCorrectAnswers: numberOfCorrectAnswers,
      numberOfQuestions: numberOfQuestions,
      quizCompletionDate: quizCompletionDate,
    );
  }

  SavedQuizResultModel copyWith({
    String? categoryTitle,
    int? numberOfCorrectAnswers,
    int? numberOfQuestions,
    DateTime? quizCompletionDate,
  }) {
    return SavedQuizResultModel(
      categoryTitle: categoryTitle ?? this.categoryTitle,
      numberOfCorrectAnswers:
          numberOfCorrectAnswers ?? this.numberOfCorrectAnswers,
      numberOfQuestions: numberOfQuestions ?? this.numberOfQuestions,
      quizCompletionDate: quizCompletionDate ?? this.quizCompletionDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'categoryTitle': categoryTitle,
      'numberOfCorrectAnswers': numberOfCorrectAnswers,
      'numberOfQuestions': numberOfQuestions,
      'quizCompletionDate': quizCompletionDate.millisecondsSinceEpoch,
    };
  }

  factory SavedQuizResultModel.fromMap(Map<String, dynamic> map) {
    return SavedQuizResultModel(
      categoryTitle: map['categoryTitle'] ?? '',
      numberOfCorrectAnswers: map['numberOfCorrectAnswers']?.toInt() ?? 0,
      numberOfQuestions: map['numberOfQuestions']?.toInt() ?? 0,
      quizCompletionDate:
          DateTime.fromMillisecondsSinceEpoch(map['quizCompletionDate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SavedQuizResultModel.fromJson(String source) =>
      SavedQuizResultModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SavedQuizResultModel(categoryTitle: $categoryTitle, numberOfCorrectAnswers: $numberOfCorrectAnswers, numberOfQuestions: $numberOfQuestions, quizCompletionDate: $quizCompletionDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SavedQuizResultModel &&
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
}
