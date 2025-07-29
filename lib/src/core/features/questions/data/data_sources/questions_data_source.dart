import 'package:f_quiz_app/src/core/resources/data_state.dart';

import '../../domain/entities/question_category.dart';

abstract class QuestionsDataSource {
  Future<DataState<List<QuestionCategory>>> loadQuestionCategories();
}
