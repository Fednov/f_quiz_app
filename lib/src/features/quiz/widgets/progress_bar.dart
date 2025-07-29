import 'package:f_quiz_app/src/core/theme/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/quiz_model.dart';
import '../view_model/provider/quiz_state_provider.dart';
import 'progress_bar_item.dart';

class ProgressBar extends ConsumerWidget {
  const ProgressBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var answerList = ref
        .watch(quizStateProvider.select((quizModel) => quizModel.answerList));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...answerList.map((answerToTheQuestion) => Padding(
              padding: EdgeInsets.only(
                right: AppDimensions.smallHorizontalPadding,
              ),
              child: answerToTheQuestion == AnswerToTheQuestion.right
                  ? const ProgressBarItemRight()
                  : const ProgressBarItemWrong(),
            )),
      ],
    );
  }
}
