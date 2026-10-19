class LeaderboardEntry {
  final String name;
  final String email;
  final int bestPercent;
  final int plays;

  const LeaderboardEntry({
    required this.name,
    required this.email,
    required this.bestPercent,
    required this.plays,
  });
}