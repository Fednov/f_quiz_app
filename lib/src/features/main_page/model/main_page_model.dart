import 'package:f_quiz_app/src/core/features/questions/domain/entities/question_category.dart';
import 'package:f_quiz_app/src/core/resources/data_state.dart';

class MainPageModel {
  final DataState<List<QuestionCategory>> assetQuestionCategories;
  final DataState<List<QuestionCategory>> remoteQuestionCategories;
  MainPageModel({
    required this.assetQuestionCategories,
    required this.remoteQuestionCategories,
  });

  factory MainPageModel.init() {
    return MainPageModel(
      assetQuestionCategories: DataInit(),
      remoteQuestionCategories: DataInit(),
    );
  }

  MainPageModel copyWith({
    DataState<List<QuestionCategory>>? assetQuestionCategories,
    DataState<List<QuestionCategory>>? remoteQuestionCategories,
  }) {
    return MainPageModel(
      assetQuestionCategories:
          assetQuestionCategories ?? this.assetQuestionCategories,
      remoteQuestionCategories:
          remoteQuestionCategories ?? this.remoteQuestionCategories,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MainPageModel &&
        other.assetQuestionCategories == assetQuestionCategories &&
        other.remoteQuestionCategories == remoteQuestionCategories;
  }

  @override
  int get hashCode =>
      assetQuestionCategories.hashCode ^ remoteQuestionCategories.hashCode;

  @override
  String toString() => 'MainPageModel(assetQuestionCategories: $assetQuestionCategories, remoteQuestionCategories: $remoteQuestionCategories)';
}
