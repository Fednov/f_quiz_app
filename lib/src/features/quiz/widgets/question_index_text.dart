import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../view_model/provider/quiz_state_provider.dart';

class QuestionIndex extends ConsumerWidget {
  const QuestionIndex({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var currentQuestionIndex = ref.watch(quizStateProvider
            .select((quizModel) => quizModel.currentQuestionIndex)) +
        1;
    var questionCount = ref.watch(quizStateProvider.select(
            (quizModel) => quizModel.questionCategory?.questions.length)) ??
        0;
    var textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.all(2.0.w),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.6),
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        '$currentQuestionIndex/$questionCount',
        style: textTheme.headlineSmall,
      ),
    );
  }
}
