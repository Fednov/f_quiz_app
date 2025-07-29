import 'package:f_quiz_app/src/features/quiz/view_model/provider/quiz_state_provider.dart';
import 'package:f_quiz_app/src/features/quiz/widgets/base_quiz_information_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuizScreenBodyResult extends ConsumerWidget {
  const QuizScreenBodyResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var rightAnswerCount = ref.watch(
      quizStateProvider.select((quizModel) => quizModel.rightAnswerCount),
    );

    var questionCount = ref.watch(
      quizStateProvider
          .select((quizModel) => quizModel.questionCategory?.questions.length),
    );

    return BaseQuizInformationScreen(
      text: 'Ваш результат: $rightAnswerCount из ${questionCount ?? 0}',
    );
  }
}
