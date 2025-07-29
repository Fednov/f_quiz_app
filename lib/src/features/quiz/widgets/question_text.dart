import 'package:f_quiz_app/src/features/quiz/view_model/provider/quiz_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuestionText extends ConsumerWidget {
  const QuestionText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var currentQuestionText = ref.watch(
      quizStateProvider
          .select((quizModel) => quizModel.currentQuestion?.questionText),
    );

    var textTheme = Theme.of(context).textTheme;

    return ColoredBox(
      color: Colors.white,
      child: Text(
        currentQuestionText ?? '',
        style: textTheme.bodyLarge,
      ),
    );
  }
}
