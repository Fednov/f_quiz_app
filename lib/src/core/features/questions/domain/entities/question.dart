import 'package:flutter/foundation.dart';

import 'answer.dart';

class Question {
  final String questionText;
  final List<Answer> answers;
  final String? comment;
  Question({
    required this.questionText,
    required this.answers,
    this.comment,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Question &&
        other.questionText == questionText &&
        listEquals(other.answers, answers) &&
        other.comment == comment;
  }

  @override
  int get hashCode =>
      questionText.hashCode ^ answers.hashCode ^ comment.hashCode;

  @override
  String toString() =>
      'Question(text: $questionText, answers: $answers, comment: $comment)';
}
