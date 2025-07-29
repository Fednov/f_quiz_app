import 'package:f_quiz_app/src/features/quiz/widgets/quiz_screen_body_error.dart';
import 'package:f_quiz_app/src/features/quiz/widgets/quiz_screen_body_in_progress.dart';
import 'package:f_quiz_app/src/features/quiz/widgets/quiz_screen_body_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/quiz_status.dart';
import '../view_model/provider/quiz_state_provider.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var quizStatus =
        ref.watch(quizStateProvider.select((quizModel) => quizModel.status));

    switch (quizStatus) {
      case QuizStatusInit():
        return const QuizScreenBodyError();
      case QuizStatusInProgress():
        return const QuizScreenBodyInProgress();
      case QuizStatusDone():
        return const QuizScreenBodyResult();

      default:
        return const QuizScreenBodyError();
    }
  }
}
