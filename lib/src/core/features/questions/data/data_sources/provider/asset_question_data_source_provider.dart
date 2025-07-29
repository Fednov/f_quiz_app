import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../asset_question_data_source.dart';

final assetQuestionDataSourceProvider =
    Provider<AssetQuestionsDataSource>((ref) => AssetQuestionsDataSource());
