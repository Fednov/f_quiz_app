import 'package:f_quiz_app/src/features/quiz/widgets/base_quiz_information_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuizScreenBodyError extends ConsumerWidget {
  const QuizScreenBodyError({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const BaseQuizInformationScreen(
      text: 'Возникла ошибка. Попробуйте ещё раз',
    );
  }
}
