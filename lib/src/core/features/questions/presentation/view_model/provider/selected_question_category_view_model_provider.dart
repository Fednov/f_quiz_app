import 'package:f_quiz_app/src/core/features/questions/domain/entities/question_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../selected_question_category_view_model.dart';

final selectedQuestionCategoryViewModelProvider =
    StateNotifierProvider<SelectedQuestionCategoryViewModel, QuestionCategory?>(
  (ref) => SelectedQuestionCategoryViewModel(),
);
