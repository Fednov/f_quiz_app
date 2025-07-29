import 'package:f_quiz_app/src/core/features/questions/domain/entities/question_category.dart';
import 'package:f_quiz_app/src/core/resources/data_state.dart';

import '../../domain/repositories/question_repository.dart';
import '../data_sources/questions_data_source.dart';

class QuestionRepositoryImpl extends QuestionRepository {
  QuestionRepositoryImpl({
    required this.assetQuestionDataSource,
    required this.remoteQuestionDataSource,
  });

  final QuestionsDataSource assetQuestionDataSource;
  final QuestionsDataSource remoteQuestionDataSource;

  @override
  Future<DataState<List<QuestionCategory>>>
      loadAssetQuestionCategories() async {
    return assetQuestionDataSource.loadQuestionCategories();
  }

  @override
  Future<DataState<List<QuestionCategory>>>
      loadRemoteQuestionCategories() async {
    return remoteQuestionDataSource.loadQuestionCategories();
  }
}
