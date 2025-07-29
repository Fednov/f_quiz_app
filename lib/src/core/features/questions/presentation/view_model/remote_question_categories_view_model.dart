import 'package:f_quiz_app/src/core/resources/data_state.dart';
import 'package:f_quiz_app/src/core/resources/usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/question_category.dart';
import '../../domain/usecases/load_remote_question_categories_usecase.dart';
import 'question_categories_view_model.dart';

class RemoteQuestionCategoriesViewModel
    extends StateNotifier<DataState<List<QuestionCategory>>>
    implements QuestionCategoriesViewModel {
  RemoteQuestionCategoriesViewModel({
    required this.loadRemoteQuestionCategoriesUsecase,
  }) : super(DataInit()) {
    loadQuestionCategories();
  }

  LoadRemoteQuestionCategoriesUsecase loadRemoteQuestionCategoriesUsecase;

  @override
  Future<void> loadQuestionCategories() async {
    state = DataLoading();

    state = await loadRemoteQuestionCategoriesUsecase(params: NoParams());
  }
}
