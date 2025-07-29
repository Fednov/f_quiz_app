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
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              savedQuizResult.categoryTitle,
              style: textStyle,
            ),
          ),
        ),
        Expanded(
          child: Text(
            '${savedQuizResult.numberOfCorrectAnswers}/${savedQuizResult.numberOfQuestions}',
            style: textStyle,
          ),
        ),
        Expanded(
          child: Text(
            '${savedQuizResult.percentageOfCorrectAnswers} %',
            style: textStyle,
          ),
        ),
        Expanded(
          flex: 2,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              savedQuizResult.quizCompletionDate.toStringFormatDMY(),
              style: textStyle,
            ),
          ),
        ),
      ],
    );
  }
}
