import 'package:f_quiz_app/src/core/features/questions/presentation/view_model/provider/asset_question_categories_view_model_provider.dart';
import 'package:f_quiz_app/src/core/features/questions/presentation/view_model/provider/remote_question_categories_view_model_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/main_page_model.dart';
import '../main_page_view_model.dart';

final mainPageStateProvider =
    StateNotifierProvider.autoDispose<MainPageViewModel, MainPageModel>((ref) {
  var mainPageViewModel = MainPageViewModel();

  ref
    ..listen(
      assetQuestionCategoriesViewModelProvider,
      (previos, next) {
        mainPageViewModel.fetchAssetQuestionCategories(
          assetQuestionCategories: next,
        );
      },
      fireImmediately: true,
    )
    ..listen(
      remoteQuestionCategoriesViewModelProvider,
      (previos, next) {
        mainPageViewModel.fetchRemoteQuestionCategories(
          remoteQuestionCategories: next,
        );
      },
      fireImmediately: true,
    );

  return mainPageViewModel;
});
