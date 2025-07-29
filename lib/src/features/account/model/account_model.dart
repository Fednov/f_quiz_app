class AccountModel {
  final bool isSavedQuizResultsDisplay;
  final String enteredEditedUserName;
  AccountModel({
    this.isSavedQuizResultsDisplay = false,
    this.enteredEditedUserName = '',
  });

  AccountModel copyWith({
    bool? isSavedQuizResultsDisplay,
    String? enteredEditedUserName,
  }) {
    return AccountModel(
      isSavedQuizResultsDisplay:
          isSavedQuizResultsDisplay ?? this.isSavedQuizResultsDisplay,
      enteredEditedUserName:
          enteredEditedUserName ?? this.enteredEditedUserName,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AccountModel &&
        other.isSavedQuizResultsDisplay == isSavedQuizResultsDisplay &&
        other.enteredEditedUserName == enteredEditedUserName;
  }

  @override
  int get hashCode =>
      isSavedQuizResultsDisplay.hashCode ^ enteredEditedUserName.hashCode;

  @override
  String toString() =>
      'AccountModel(isSavedQuizResultsDisplay: $isSavedQuizResultsDisplay, enteredEditedUserName: $enteredEditedUserName)';
}
