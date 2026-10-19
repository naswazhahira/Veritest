class Question {
  final String text;
  final List<String> options;
  final int answerIndex;
  final String explanation;

  const Question({
    required this.text,
    required this.options,
    required this.answerIndex,
    required this.explanation,
  });
}
