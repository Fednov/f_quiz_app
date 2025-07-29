import 'package:f_quiz_app/src/core/theme/app_dimensions.dart';
import 'package:f_quiz_app/src/core/widgets/app_animated_background_widget.dart';
import 'package:f_quiz_app/src/features/quiz/view_model/provider/quiz_state_provider.dart';
import 'package:f_quiz_app/src/features/quiz/widgets/answer_list_view.dart';
import 'package:f_quiz_app/src/features/quiz/widgets/information_text_bubble.dart';
import 'package:f_quiz_app/src/features/quiz/widgets/progress_bar.dart';
import 'package:f_quiz_app/src/features/quiz/widgets/question_index_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuizScreenBodyInProgress extends ConsumerWidget {
  const QuizScreenBodyInProgress({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var questionText = ref.watch(
      quizStateProvider
          .select((quizModel) => quizModel.currentQuestion?.questionText),
    );

    return AppAnimatedBackground(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.mediumHorizontalPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InformationTextBubble(text: questionText ?? ''),
            SizedBox(
              height: AppDimensions.largeVerticalPadding,
            ),
            const AnswerListView(),
            SizedBox(
              height: AppDimensions.largeVerticalPadding,
            ),
            const QuestionIndex(),
            SizedBox(
              height: AppDimensions.mediumVerticalPadding,
            ),
            const ProgressBar(),
          ],
        ),
      ),
    );
  }
}
