import 'package:f_quiz_app/src/core/features/questions/domain/entities/answer.dart';
import 'package:f_quiz_app/src/core/utils/constants/app_constants_string.dart';
import 'package:f_quiz_app/src/core/widgets/app_base_animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../view_model/provider/quiz_state_provider.dart';

class AnswerButton extends ConsumerWidget {
  const AnswerButton({super.key, required this.answer, required this.index});

  final int index;
  final Answer answer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBaseAnimatedButton(
      title:
          '${AppConstantsString.englishAlphabetStringList[index].toUpperCase()}) ${answer.text}',
      color: Colors.indigo,
      width: 90.0.w,
      titleAlignment: Alignment.centerLeft,
      onTap: () => ref
          .read(quizStateProvider.notifier)
          .onAnsweringQuestion(answer: answer),
    );
  }
}
