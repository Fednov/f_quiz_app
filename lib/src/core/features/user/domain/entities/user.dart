import 'package:flutter/foundation.dart';

import 'saved_quiz_result.dart';

class User {
  final String id;
  final String name;
  final DateTime registrationDate;
  final String? photoUrl;
  final List<SavedQuizResult> results;
  User({
    required this.id,
    required this.name,
    required this.registrationDate,
    required this.results,
    this.photoUrl,
  });

  User copyWith({
    String? id,
    String? name,
    DateTime? registrationDate,
    String? photoUrl,
    List<SavedQuizResult>? results,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      registrationDate: registrationDate ?? this.registrationDate,
      photoUrl: photoUrl ?? this.photoUrl,
      results: results ?? this.results,
    );
  }

  String get totalAttempts => results.length.toString();
  String get totalQuestionsAnswered => results.isNotEmpty
      ? results
          .map((savedQuizResult) => savedQuizResult.numberOfQuestions)
          .toList()
          .reduce((a, b) => a + b)
          .toString()
      : '0';
  String get totalCorrectAnswers => results.isNotEmpty
      ? results
          .map((savedQuizResult) => savedQuizResult.numberOfCorrectAnswers)
          .toList()
          .reduce((a, b) => a + b)
          .toString()
      : '0';
  String get percentageOfCorrectAnswers => results.isNotEmpty
      ? (num.parse(totalCorrectAnswers) *
              100 /
              (num.parse(totalQuestionsAnswered)))
          .toStringAsFixed(1)
      : '0';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.name == name &&
        other.registrationDate == registrationDate &&
        listEquals(other.results, results);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        registrationDate.hashCode ^
        results.hashCode;
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, registrationDate: $registrationDate, results: $results)';
  }
}
