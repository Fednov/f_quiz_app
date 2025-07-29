import 'package:f_quiz_app/src/core/features/questions/presentation/view_model/provider/selected_question_category_view_model_provider.dart';
import 'package:f_quiz_app/src/core/routes/app_routes.dart';
import 'package:f_quiz_app/src/core/widgets/app_base_animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToMainPageButton extends ConsumerWidget {
  const ToMainPageButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBaseAnimatedButton(
      title: 'Назад',
      color: Colors.indigo,
      onTap: () {
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.mainPage,
          (f) => false,
        );
        ref
            .read(selectedQuestionCategoryViewModelProvider.notifier)
            .clearSelectedCategory();
      },
    );
  }
}
