import 'package:f_quiz_app/src/core/features/questions/data/data_sources/provider/asset_question_data_source_provider.dart';
import 'package:f_quiz_app/src/core/features/questions/data/data_sources/provider/remote_question_data_source_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../question_repository_impl.dart';

final questionRepositoryImplProvider = Provider<QuestionRepositoryImpl>((ref) {
  var assetQuestionDataSource = ref.read(assetQuestionDataSourceProvider);
  var remoteQuestionDataSource = ref.read(firebaseQuestionDataSourceProvider);

  return QuestionRepositoryImpl(
    assetQuestionDataSource: assetQuestionDataSource,
    remoteQuestionDataSource: remoteQuestionDataSource,
  );
});
