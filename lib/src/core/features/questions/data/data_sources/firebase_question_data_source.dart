import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f_quiz_app/src/core/features/questions/data/data_sources/questions_data_source.dart';
import 'package:f_quiz_app/src/core/features/questions/data/models/question_category_model.dart';
import 'package:f_quiz_app/src/core/features/questions/domain/entities/question_category.dart';
import 'package:f_quiz_app/src/core/resources/data_state.dart';
import 'package:f_quiz_app/src/core/utils/constants/app_constants_string.dart';
import 'package:f_quiz_app/src/core/utils/system_functions/app_system_functions.dart';

class FirebaseQuestionDataSource implements QuestionsDataSource {
  @override
  Future<DataState<List<QuestionCategory>>> loadQuestionCategories() async {
    try {
      var firebaseQuestionCollectionRef = FirebaseFirestore.instance
          .collection(AppConstantsString.questionsStorageName);
      var snapshot = await firebaseQuestionCollectionRef.get();
      var data = snapshot.docs.map((doc) => doc.data());
      var questionCategoryModelList =
          data.map(QuestionCategoryModel.fromMap).toList();
      var questionCategoryList = questionCategoryModelList
          .map((element) => element.toEntity())
          .toList();

      return DataSuccess(data: questionCategoryList);
    } catch (error) {
      AppSystemFunctions.showSnackBarGlobal(content: error.toString());
      return DataFailed(message: error.toString());
    }
  }
}
