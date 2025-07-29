import 'package:f_quiz_app/src/core/features/questions/domain/entities/answer.dart';
import 'package:f_quiz_app/src/core/features/questions/domain/entities/question_category.dart';
import 'package:f_quiz_app/src/features/quiz/model/quiz_status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/quiz_model.dart';
import '../repository/quiz_repository.dart';

class QuizViewModel extends StateNotifier<QuizModel> {
  QuizViewModel({required this.quizRepository}) : super(QuizModel());

  final QuizRepository quizRepository;

  int get currentQuestionIndex => state.currentQuestionIndex;

  QuestionCategory? get questionCategory => state.questionCategory;

  void fetchQuestionCategory({QuestionCategory? questionCategory}) {
    if (questionCategory != null) {
      state = state.copyWith(questionCategory: questionCategory);

      _selectCurrentQuestion();

      state = state.copyWith(status: const QuizStatusInProgress());
    }
  }

  void onAnsweringQuestion({required Answer answer}) {
    if (answer.isCorrect) {
      _onRightAnswer();
    } else {
      _onWrongAnswer();
    }

    var questionList = state.questionCategory?.questions;

    if (questionList != null) {
      if ((currentQuestionIndex + 1) < questionList.length) {
        state = state.copyWith(
          currentQuestionIndex: currentQuestionIndex + 1,
        );
        _selectCurrentQuestion();
      } else {
        _onQuizDone();
      }
    }
  }

  void onQuizClear() {
    state = QuizModel.init();
  }

  void _selectCurrentQuestion() {
    if (questionCategory != null) {
      if (questionCategory!.questions.length > currentQuestionIndex) {
        state = state.copyWith(
          currentQuestion: questionCategory?.questions[currentQuestionIndex],
        );
      }
    }
  }

  void _onRightAnswer() {
    var currentRightAnswerCount = state.rightAnswerCount;
    var currentAnswerList = state.answerList;

    state = state.copyWith(
      rightAnswerCount: currentRightAnswerCount + 1,
      answerList: [...currentAnswerList, AnswerToTheQuestion.right],
    );
  }

  void _onWrongAnswer() {
    var currentAnswerList = state.answerList;

    state = state.copyWith(
      answerList: [...currentAnswerList, AnswerToTheQuestion.wrong],
    );
  }

  Future<void> _onQuizDone() async {
    state = state.copyWith(status: const QuizStatusDone());

    await quizRepository.saveQuizResult(
      categoryTitle: state.questionCategory?.title ?? 'Неизвестная категория',
      numberOfCorrectAnswers: state.rightAnswerCount,
      numberOfQuestions: state.questionCategory?.questions.length ?? 0,
      quizCompletionDate: DateTime.now(),
    );
  }
}
