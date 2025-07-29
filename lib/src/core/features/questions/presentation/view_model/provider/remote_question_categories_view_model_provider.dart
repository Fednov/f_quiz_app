import 'package:f_quiz_app/src/core/features/questions/domain/entities/question_category.dart';
import 'package:f_quiz_app/src/core/features/questions/domain/usecases/provider/load_remote_question_categories_usecase_provider.dart';
import 'package:f_quiz_app/src/core/resources/data_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../remote_question_categories_view_model.dart';

final remoteQuestionCategoriesViewModelProvider = StateNotifierProvider<
    RemoteQuestionCategoriesViewModel,
    DataState<List<QuestionCategory>>>((ref) {
  var loadRemoteQuestionCategoriesUsecase =
      ref.read(loadRemoteQuestionCategoriesUsecaseProvider);

  return RemoteQuestionCategoriesViewModel(
    loadRemoteQuestionCategoriesUsecase: loadRemoteQuestionCategoriesUsecase,
  );
});
