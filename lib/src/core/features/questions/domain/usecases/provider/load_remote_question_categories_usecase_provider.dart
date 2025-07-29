import 'package:f_quiz_app/src/core/features/questions/data/repositories/provider/question_repository_impl_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../load_remote_question_categories_usecase.dart';

final loadRemoteQuestionCategoriesUsecaseProvider =
    Provider<LoadRemoteQuestionCategoriesUsecase>((ref) {
  var questionRepository = ref.read(questionRepositoryImplProvider);

  return LoadRemoteQuestionCategoriesUsecase(
    questionRepository: questionRepository,
  );
});
