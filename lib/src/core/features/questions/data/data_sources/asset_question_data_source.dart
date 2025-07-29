import 'dart:convert';
import 'dart:developer';

import 'package:f_quiz_app/src/core/configs/assets/app_assets_questions.dart';
import 'package:f_quiz_app/src/core/features/questions/data/data_sources/questions_data_source.dart';
import 'package:f_quiz_app/src/core/features/questions/data/models/question_category_model.dart';
import 'package:f_quiz_app/src/core/features/questions/domain/entities/question_category.dart';
import 'package:f_quiz_app/src/core/resources/data_state.dart';
import 'package:f_quiz_app/src/core/utils/system_functions/app_system_functions.dart';
import 'package:flutter/services.dart';

class AssetQuestionsDataSource implements QuestionsDataSource {
  @override
  Future<DataState<List<QuestionCategory>>> loadQuestionCategories() async {
    try {
      String jsonQuestionCategoriesList =
          await rootBundle.loadString(AppAssetsQuestions.questionCategories);

      List<dynamic> decodedQuestionCategoriesList =
          jsonDecode(jsonQuestionCategoriesList);

      var questionCategoriesModelList = decodedQuestionCategoriesList
          .map((element) => QuestionCategoryModel.fromMap(element))
          .toList();

      var questionCategoriesList = questionCategoriesModelList
          .map((element) => element.toEntity())
          .toList();

      return DataSuccess(data: questionCategoriesList);
    } catch (error) {
      log(error.toString());
      AppSystemFunctions.showSnackBarGlobal(content: error.toString());
      return DataFailed(message: error.toString());
    }
  }
}
