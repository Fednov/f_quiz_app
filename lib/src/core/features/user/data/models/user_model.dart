import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import 'package:f_quiz_app/src/core/extensions/string_formatter.dart';
import 'package:f_quiz_app/src/core/resources/model.dart';

import '../../domain/entities/user.dart';
import 'saved_quiz_result_model.dart';

class UserModel implements Model<User> {
  final String id;
  final String name;
  final DateTime registrationDate;
  final String? photoUrl;
  final List<SavedQuizResultModel> results;
  UserModel({
    required this.id,
    required this.name,
    required this.registrationDate,
    required this.results,
    this.photoUrl,
  });

  factory UserModel.create({required String id}) {
    return UserModel(
      id: id,
      name:
          'Уважаемый пользователь ${const Uuid().v4().limitCharacters(numberOfCharacters: 7)}',
      registrationDate: DateTime.now(),
      results: const [],
    );
  }

  factory UserModel.fromEntity({required User entity}) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      registrationDate: entity.registrationDate,
      photoUrl: entity.photoUrl,
      results: entity.results
          .map(
            (element) => SavedQuizResultModel.fromEntity(entity: element),
          )
          .toList(),
    );
  }

  @override
  User toEntity() {
    return User(
      id: id,
      name: name,
      registrationDate: registrationDate,
      photoUrl: photoUrl,
      results: results.map((element) => element.toEntity()).toList(),
    );
  }

  UserModel copyWith({
    String? id,
    String? name,
    DateTime? registrationDate,
    String? photoUrl,
    List<SavedQuizResultModel>? results,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      registrationDate: registrationDate ?? this.registrationDate,
      photoUrl: photoUrl ?? this.photoUrl,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'registrationDate': registrationDate.millisecondsSinceEpoch,
      'photoUrl': photoUrl,
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      registrationDate:
          DateTime.fromMillisecondsSinceEpoch(map['registrationDate']),
      photoUrl: map['photoUrl'],
      results: List<SavedQuizResultModel>.from(
        map['results']?.map(
          (x) => SavedQuizResultModel.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.name == name &&
        other.registrationDate == registrationDate &&
        other.photoUrl == photoUrl &&
        listEquals(other.results, results);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        registrationDate.hashCode ^
        photoUrl.hashCode ^
        results.hashCode;
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, registrationDate: $registrationDate, photoUrl: $photoUrl, results: $results)';
  }
}
