import 'package:f_quiz_app/src/core/features/questions/domain/entities/question_category.dart';
import 'package:f_quiz_app/src/core/resources/data_state.dart';
import 'package:f_quiz_app/src/core/theme/app_dimensions.dart';
import 'package:f_quiz_app/src/core/utils/system_functions/app_system_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'question_category_select_button.dart';

class BaseQuestionCategoryListView extends ConsumerWidget {
  const BaseQuestionCategoryListView({
    super.key,
    required this.questionCategoryList,
  });

  final DataState<List<QuestionCategory>> questionCategoryList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    switch (questionCategoryList) {
      case DataInit():
        return Container();
      case DataLoading():
        return const CircularProgressIndicator();
      case DataFailed():
        var errorMessage = questionCategoryList.message;
        if (errorMessage != null) {
          WidgetsBinding.instance.addPostFrameCallback(
            (timeStamp) => AppSystemFunctions.showSnackBar(
              context: context,
              content: errorMessage,
            ),
          );
        }
      case DataSuccess():
        var questionCategories = questionCategoryList.data;
        if (questionCategories != null) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: questionCategories
                  .map(
                    (element) => Padding(
                      padding: EdgeInsets.only(
                        bottom: AppDimensions.smallVerticalPadding,
                      ),
                      child: QuestionCategorySelectButton(
                        questionCategory: element,
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        }

      default:
        Container();
    }

    return Container();
  }
}
