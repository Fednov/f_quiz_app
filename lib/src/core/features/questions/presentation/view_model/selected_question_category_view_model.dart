import 'package:f_quiz_app/src/core/features/questions/domain/entities/question_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedQuestionCategoryViewModel
    extends StateNotifier<QuestionCategory?> {
  SelectedQuestionCategoryViewModel() : super(null);

  void selectQuestionCategory({
    required QuestionCategory questionCategory,
  }) {
    state = questionCategory;
  }

  void clearSelectedCategory() {
    state = null;
  }
}
