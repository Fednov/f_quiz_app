import 'package:f_quiz_app/src/core/features/questions/presentation/view_model/provider/selected_question_category_view_model_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/quiz_model.dart';
import '../../repository/provider/quiz_repository_provider.dart';
import '../quiz_view_model.dart';

final quizStateProvider =
    StateNotifierProvider.autoDispose<QuizViewModel, QuizModel>((ref) {
  var quizRepository = ref.read(quizRepositoryProvider);
  var quizViewModel = QuizViewModel(quizRepository: quizRepository);

  ref.listen(
    selectedQuestionCategoryViewModelProvider,
    (previos, next) {
      quizViewModel.fetchQuestionCategory(questionCategory: next);
    },
    fireImmediately: true,
  );

  return quizViewModel;
});
