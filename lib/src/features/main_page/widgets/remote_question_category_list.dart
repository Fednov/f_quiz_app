import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/provider/main_page_state_provider.dart';
import 'base_question_category_list_view.dart';

class RemoteQuestionCategoryList extends ConsumerWidget {
  const RemoteQuestionCategoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var remoteQuestionCategoryList = ref.watch(
      mainPageStateProvider
          .select((mainPageModel) => mainPageModel.remoteQuestionCategories),
    );

    return BaseQuestionCategoryListView(
      questionCategoryList: remoteQuestionCategoryList,
    );
  }
}
