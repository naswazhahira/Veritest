class ScoreRecord {
  final String userEmail;
  final String userName;
  final String categoryTitle;
  final int score;
  final int total;
  final DateTime date;

  const ScoreRecord({
    required this.userEmail,
    required this.userName,
    required this.categoryTitle,
    required this.score,
    required this.total,
    required this.date,
  });

  int get percent => total == 0 ? 0 : (score * 100 / total).round();
}