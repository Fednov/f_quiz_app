import 'package:f_quiz_app/src/core/features/questions/data/repositories/provider/question_repository_impl_provider.dart';
import 'package:f_quiz_app/src/core/features/questions/domain/usecases/load_asset_question_categories_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loadAssetQuestionCategoriesUsecaseProvider =
    Provider<LoadAssetQuestionCategoriesUsecase>((ref) {
  var questionRepository = ref.read(questionRepositoryImplProvider);

  return LoadAssetQuestionCategoriesUsecase(
    questionRepository: questionRepository,
  );
});
