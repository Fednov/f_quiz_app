import 'package:f_quiz_app/src/core/resources/data_state.dart';
import 'package:f_quiz_app/src/core/resources/usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/question_category.dart';
import '../../domain/usecases/load_asset_question_categories_usecase.dart';
import 'question_categories_view_model.dart';

class AssetQuestionCategoriesViewModel
    extends StateNotifier<DataState<List<QuestionCategory>>>
    implements QuestionCategoriesViewModel {
  AssetQuestionCategoriesViewModel({
    required this.loadAssetQuestionCategoriesUsecase,
  }) : super(DataInit()) {
    loadQuestionCategories();
  }

  LoadAssetQuestionCategoriesUsecase loadAssetQuestionCategoriesUsecase;

  @override
  Future<void> loadQuestionCategories() async {
    state = DataLoading();

    state = await loadAssetQuestionCategoriesUsecase(params: NoParams());
  }
}
