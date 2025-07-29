import 'dart:convert';

import 'package:f_quiz_app/src/core/resources/model.dart';

import '../../domain/entities/answer.dart';

class AnswerModel implements Model<Answer> {
  final String text;
  final bool isCorrect;
  final String? comment;

  AnswerModel({
    required this.text,
    required this.isCorrect,
    this.comment,
  });

  @override
  Answer toEntity() {
    return Answer(
      text: text,
      isCorrect: isCorrect,
      comment: comment,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'isCorrect': isCorrect,
      'comment': comment,
    };
  }

  factory AnswerModel.fromMap(Map<String, dynamic> map) {
    return AnswerModel(
      text: map['text'] ?? '',
      isCorrect: map['isCorrect'] ?? false,
      comment: map['comment'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AnswerModel.fromJson(String source) =>
      AnswerModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AnswerModel &&
        other.text == text &&
        other.isCorrect == isCorrect &&
        other.comment == comment;
  }

  @override
  int get hashCode => text.hashCode ^ isCorrect.hashCode ^ comment.hashCode;

  @override
  String toString() =>
      'AnswerModel(text: $text, isCorrect: $isCorrect, comment: $comment)';
}
