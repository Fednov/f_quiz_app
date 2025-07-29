import 'package:flutter/foundation.dart';

import 'package:f_quiz_app/src/core/features/questions/domain/entities/question.dart';
import 'package:f_quiz_app/src/core/features/questions/domain/entities/question_category.dart';

import 'quiz_status.dart';

enum AnswerToTheQuestion { right, wrong }

class QuizModel {
  final QuestionCategory? questionCategory;
  final Question? currentQuestion;
  final int currentQuestionIndex;
  final int rightAnswerCount;
  final List<AnswerToTheQuestion> answerList;
  final QuizStatus status;
  QuizModel({
    this.questionCategory,
    this.currentQuestion,
    this.currentQuestionIndex = 0,
    this.rightAnswerCount = 0,
    this.answerList = const [],
    this.status = const QuizStatusInit(),
  });

  factory QuizModel.init() => QuizModel();

  QuizModel copyWith({
    QuestionCategory? questionCategory,
    Question? currentQuestion,
    int? currentQuestionIndex,
    int? rightAnswerCount,
    List<AnswerToTheQuestion>? answerList,
    QuizStatus? status,
  }) {
    return QuizModel(
      questionCategory: questionCategory ?? this.questionCategory,
      currentQuestion: currentQuestion ?? this.currentQuestion,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      rightAnswerCount: rightAnswerCount ?? this.rightAnswerCount,
      answerList: answerList ?? this.answerList,
      status: status ?? this.status,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuizModel &&
        other.questionCategory == questionCategory &&
        other.currentQuestion == currentQuestion &&
        other.currentQuestionIndex == currentQuestionIndex &&
        other.rightAnswerCount == rightAnswerCount &&
        listEquals(other.answerList, answerList) &&
        other.status == status;
  }

  @override
  int get hashCode {
    return questionCategory.hashCode ^
        currentQuestion.hashCode ^
        currentQuestionIndex.hashCode ^
        rightAnswerCount.hashCode ^
        answerList.hashCode ^
        status.hashCode;
  }

  @override
  String toString() {
    return 'QuizModel(questionCategory: $questionCategory, currentQuestion: $currentQuestion, currentQuestionIndex: $currentQuestionIndex, rightAnswerCount: $rightAnswerCount, answerList: $answerList, status: $status)';
  }
}
