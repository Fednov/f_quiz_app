import 'package:f_quiz_app/src/core/features/questions/domain/entities/question_category.dart';
import 'package:f_quiz_app/src/core/features/questions/presentation/view_model/provider/selected_question_category_view_model_provider.dart';
import 'package:f_quiz_app/src/core/routes/app_routes.dart';
import 'package:f_quiz_app/src/core/theme/app_colors.dart';
import 'package:f_quiz_app/src/core/widgets/app_base_animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuestionCategorySelectButton extends ConsumerWidget {
  const QuestionCategorySelectButton(
      {super.key, required this.questionCategory});

  final QuestionCategory questionCategory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBaseAnimatedButton(
      title: questionCategory.title,
      color: AppColors.autumnEmberPurple,
      onTap: () {
        ref
            .read(selectedQuestionCategoryViewModelProvider.notifier)
            .selectQuestionCategory(questionCategory: questionCategory);
        Navigator.of(context).pushReplacementNamed(AppRoutes.quiz);
      },
    );
  }
}
