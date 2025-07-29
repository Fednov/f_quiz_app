import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:f_quiz_app/src/core/resources/model.dart';

import '../../domain/entities/question.dart';
import 'answer_model.dart';

class QuestionModel implements Model<Question> {
  final String questionText;
  final List<AnswerModel> answers;
  final String? comment;
  QuestionModel({
    required this.questionText,
    required this.answers,
    this.comment,
  });

  @override
  Question toEntity() {
    return Question(
      questionText: questionText,
      answers: answers.map((answerModel) => answerModel.toEntity()).toList(),
      comment: comment,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'questionText': questionText,
      'answers': answers.map((x) => x.toMap()).toList(),
      'comment': comment,
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      questionText: map['questionText'] ?? '',
      answers: List<AnswerModel>.from(
        map['answers']?.map(
          (x) => AnswerModel.fromMap(x),
        ),
      ),
      comment: map['comment'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) => QuestionModel.fromMap(
        json.decode(source),
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuestionModel &&
        other.questionText == questionText &&
        listEquals(other.answers, answers) &&
        other.comment == comment;
  }

  @override
  int get hashCode =>
      questionText.hashCode ^ answers.hashCode ^ comment.hashCode;

  @override
  String toString() =>
      'QuestionModel(questionText: $questionText, answers: $answers, comment: $comment)';

  QuestionModel copyWith({
    String? questionText,
    List<AnswerModel>? answers,
    String? comment,
  }) {
    return QuestionModel(
      questionText: questionText ?? this.questionText,
      answers: answers ?? this.answers,
      comment: comment ?? this.comment,
    );
  }
}
