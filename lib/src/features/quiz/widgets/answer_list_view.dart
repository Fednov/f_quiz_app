import 'package:f_quiz_app/src/core/theme/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/provider/quiz_state_provider.dart';
import 'answer_button.dart';

class AnswerListView extends ConsumerWidget {
  const AnswerListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var answerList = ref.watch(
          quizStateProvider
              .select((quizModel) => quizModel.currentQuestion?.answers),
        ) ??
        [];

    return SingleChildScrollView(
      child: Column(
        children: [
          ...answerList.map(
            (element) => Padding(
              padding: EdgeInsets.only(
                bottom: AppDimensions.smallVerticalPadding,
              ),
              child: AnswerButton(
                answer: element,
                index: answerList.indexOf(element),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
