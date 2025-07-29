import 'package:f_quiz_app/src/core/features/questions/domain/entities/question_category.dart';
import 'package:f_quiz_app/src/core/resources/data_state.dart';

abstract class QuestionRepository {
  Future<DataState<List<QuestionCategory>>> loadAssetQuestionCategories();
  Future<DataState<List<QuestionCategory>>> loadRemoteQuestionCategories();
}
