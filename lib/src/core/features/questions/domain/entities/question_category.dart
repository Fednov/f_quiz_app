import 'package:flutter/foundation.dart';

import 'question.dart';

class QuestionCategory {
  final String title;
  final List<Question> questions;
  final String? description;
  QuestionCategory({
    required this.title,
    required this.questions,
    this.description,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuestionCategory &&
        other.title == title &&
        listEquals(other.questions, questions) &&
        other.description == description;
  }

  @override
  int get hashCode =>
      title.hashCode ^ questions.hashCode ^ description.hashCode;

  @override
  String toString() =>
      'QuestionCategory(title: $title, questions: $questions, comment: $description)';
}
