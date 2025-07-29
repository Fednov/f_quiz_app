import 'package:f_quiz_app/src/core/resources/data_state.dart';
import 'package:f_quiz_app/src/core/resources/usecase.dart';

import '../entities/question_category.dart';
import '../repositories/question_repository.dart';

class LoadRemoteQuestionCategoriesUsecase
    extends UseCase<Future<DataState<List<QuestionCategory>>>, NoParams> {
  LoadRemoteQuestionCategoriesUsecase({required this.questionRepository});
  final QuestionRepository questionRepository;

  @override
  Future<DataState<List<QuestionCategory>>> call({
    required NoParams params,
  }) async {
    return questionRepository.loadRemoteQuestionCategories();
  }
}
