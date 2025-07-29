import 'package:f_quiz_app/src/core/features/questions/domain/entities/question_category.dart';
import 'package:f_quiz_app/src/core/features/questions/domain/usecases/provider/load_asset_question_categories_usecase_provider.dart';
import 'package:f_quiz_app/src/core/resources/data_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../asset_question_categories_view_model.dart';

final assetQuestionCategoriesViewModelProvider = StateNotifierProvider<
    AssetQuestionCategoriesViewModel, DataState<List<QuestionCategory>>>((ref) {
  var loadAssetQuestionCategoriesUsecase =
      ref.read(loadAssetQuestionCategoriesUsecaseProvider);

  return AssetQuestionCategoriesViewModel(
    loadAssetQuestionCategoriesUsecase: loadAssetQuestionCategoriesUsecase,
  );
});
