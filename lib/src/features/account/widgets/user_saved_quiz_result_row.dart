import 'package:f_quiz_app/src/core/extensions/datetime_formatter.dart';
import 'package:f_quiz_app/src/core/features/user/domain/entities/saved_quiz_result.dart';
import 'package:flutter/material.dart';

class UserSavedQuizResultRow extends StatelessWidget {
  const UserSavedQuizResultRow({
    super.key,
    required this.savedQuizResult,
  });

  final SavedQuizResult savedQuizResult;

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.bodyLarge;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: _CategoryTitle(
            savedQuizResult: savedQuizResult,
            textStyle: textStyle,
          ),
        ),
        Expanded(
          child: _NumberOfQuestionsAndCorrectAnswers(
            savedQuizResult: savedQuizResult,
            textStyle: textStyle,
          ),
        ),
        Expanded(
          child: _PercentageOfCorrectAnswers(
            savedQuizResult: savedQuizResult,
            textStyle: textStyle,
          ),
        ),
        Expanded(
          flex: 2,
          child: _QuizCompletionDate(
            savedQuizResult: savedQuizResult,
            textStyle: textStyle,
          ),
        ),
      ],
    );
  }
}

class _CategoryTitle extends StatelessWidget {
  const _CategoryTitle({
    required this.savedQuizResult,
    required this.textStyle,
  });

  final SavedQuizResult savedQuizResult;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Text(
        savedQuizResult.categoryTitle,
        style: textStyle,
      ),
    );
  }
}

class _NumberOfQuestionsAndCorrectAnswers extends StatelessWidget {
  const _NumberOfQuestionsAndCorrectAnswers({
    required this.savedQuizResult,
    required this.textStyle,
  });

  final SavedQuizResult savedQuizResult;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        '${savedQuizResult.numberOfCorrectAnswers}/${savedQuizResult.numberOfQuestions}',
        style: textStyle,
      ),
    );
  }
}

class _PercentageOfCorrectAnswers extends StatelessWidget {
  const _PercentageOfCorrectAnswers({
    required this.savedQuizResult,
    required this.textStyle,
  });

  final SavedQuizResult savedQuizResult;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        '${savedQuizResult.percentageOfCorrectAnswers} %',
        style: textStyle,
      ),
    );
  }
}

class _QuizCompletionDate extends StatelessWidget {
  const _QuizCompletionDate({
    required this.savedQuizResult,
    required this.textStyle,
  });

  final SavedQuizResult savedQuizResult;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        savedQuizResult.quizCompletionDate.toStringFormatDMY(),
        style: textStyle,
      ),
    );
  }
}
