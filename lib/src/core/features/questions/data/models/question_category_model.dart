import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:f_quiz_app/src/core/resources/model.dart';

import '../../domain/entities/question_category.dart';
import 'question_model.dart';

class QuestionCategoryModel implements Model<QuestionCategory> {
  final String title;
  final List<QuestionModel> questions;
  final String? description;

  QuestionCategoryModel({
    required this.title,
    required this.questions,
    this.description,
  });

  @override
  QuestionCategory toEntity() {
    return QuestionCategory(
      title: title,
      questions:
          questions.map((questionModel) => questionModel.toEntity()).toList(),
      description: description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'description': description,
    };
  }

  factory QuestionCategoryModel.fromMap(Map<String, dynamic> map) {
    return QuestionCategoryModel(
      title: map['title'] ?? '',
      questions: List<QuestionModel>.from(
        map['questions']?.map(
          (x) => QuestionModel.fromMap(x),
        ),
      ),
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionCategoryModel.fromJson(String source) =>
      QuestionCategoryModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuestionCategoryModel &&
        other.title == title &&
        listEquals(other.questions, questions) &&
        other.description == description;
  }

  @override
  int get hashCode =>
      title.hashCode ^ questions.hashCode ^ description.hashCode;

  @override
  String toString() =>
      'QuestionCategoryModel(title: $title, questions: $questions, description: $description)';
}
