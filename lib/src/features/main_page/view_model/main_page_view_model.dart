import 'package:f_quiz_app/src/core/features/questions/domain/entities/question_category.dart';
import 'package:f_quiz_app/src/core/resources/data_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/main_page_model.dart';

class MainPageViewModel extends StateNotifier<MainPageModel> {
  MainPageViewModel() : super(MainPageModel.init());

  void fetchAssetQuestionCategories({
    required DataState<List<QuestionCategory>> assetQuestionCategories,
  }) {
    state = state.copyWith(assetQuestionCategories: assetQuestionCategories);
  }

  void fetchRemoteQuestionCategories({
    required DataState<List<QuestionCategory>> remoteQuestionCategories,
  }) {
    state = state.copyWith(remoteQuestionCategories: remoteQuestionCategories);
  }
}
