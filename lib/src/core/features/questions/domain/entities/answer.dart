class Answer {
  final String text;
  final bool isCorrect;
  final String? comment;
  Answer({
    required this.text,
    required this.isCorrect,
    this.comment,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Answer &&
      other.text == text &&
      other.isCorrect == isCorrect &&
      other.comment == comment;
  }

  @override
  int get hashCode => text.hashCode ^ isCorrect.hashCode ^ comment.hashCode;

  @override
  String toString() => 'Answer(text: $text, isCorrect: $isCorrect, comment: $comment)';
}
