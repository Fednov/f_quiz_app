import 'package:flutter/material.dart';

import 'asset_question_category_list.dart';
import 'remote_question_category_list.dart';

class QuestionCategories extends StatelessWidget {
  const QuestionCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          AssetQuestionCategoryList(),
          RemoteQuestionCategoryList(),
        ],
      ),
    );
  }
}
