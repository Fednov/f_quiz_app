import 'package:f_quiz_app/src/core/features/questions/presentation/view_model/provider/remote_question_categories_view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Currently disabled

class MainPageGestureHandler extends ConsumerWidget {
  const MainPageGestureHandler({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onVerticalDragStart: (DragStartDetails dragStartDetails) {
        ref
            .read(remoteQuestionCategoriesViewModelProvider.notifier)
            .loadQuestionCategories();
      },
      child: child,
    );
  }
}
