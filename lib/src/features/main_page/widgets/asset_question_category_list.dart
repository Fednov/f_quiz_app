import 'package:f_quiz_app/src/features/main_page/view_model/provider/main_page_state_provider.dart';
import 'package:f_quiz_app/src/features/main_page/widgets/base_question_category_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AssetQuestionCategoryList extends ConsumerWidget {
  const AssetQuestionCategoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var assetQuestionCategoryList = ref.watch(
      mainPageStateProvider
          .select((mainPageModel) => mainPageModel.assetQuestionCategories),
    );

    return BaseQuestionCategoryListView(
      questionCategoryList: assetQuestionCategoryList,
    );
  }
}
