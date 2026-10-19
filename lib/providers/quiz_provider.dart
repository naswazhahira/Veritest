import 'package:flutter/foundation.dart';

import '../models/app_user.dart';
import '../models/leaderboard_entry.dart';
import '../models/question.dart';
import '../models/quiz_category.dart';
import '../models/score_record.dart';

class QuizProvider extends ChangeNotifier {
  QuizCategory? _category;
  AppUser? _player;
  List<Question> _questions = [];
  List<int?> _answers = [];
  int _index = 0;
  final List<ScoreRecord> _records = [];

  String get userName => _player?.name ?? '';
  String get categoryTitle => _category?.title ?? '';
  List<Question> get questions => _questions;
  List<int?> get answers => _answers;
  int get currentIndex => _index;
  int get total => _questions.length;
  Question get currentQuestion => _questions[_index];
  int? get selectedAnswer => _answers[_index];
  bool get isAnswered => selectedAnswer != null;
  bool get isLast => _index == total - 1;

  int get score {
    var s = 0;
    for (var i = 0; i < _questions.length; i++) {
      if (_answers[i] == _questions[i].answerIndex) s++;
    }
    return s;
  }

  int get wrong => total - score;

  void start(QuizCategory category, AppUser player) {
    _category = category;
    _player = player;
    _questions = List.of(category.questions)..shuffle();
    _answers = List<int?>.filled(_questions.length, null);
    _index = 0;
    notifyListeners();
  }

  void replay() {
    if (_category != null && _player != null) start(_category!, _player!);
  }

  void select(int optionIndex) {
    if (isAnswered) return;
    _answers[_index] = optionIndex;
    notifyListeners();
  }

  void next() {
    if (!isLast) {
      _index++;
      notifyListeners();
    }
  }

  void finish() {
    _records.add(ScoreRecord(
      userEmail: _player!.email,
      userName: _player!.name,
      categoryTitle: _category!.title,
      score: score,
      total: total,
      date: DateTime.now(),
    ));
    notifyListeners();
  }

  void renameUser(String email, String newName) {
    for (var i = 0; i < _records.length; i++) {
      final r = _records[i];
      if (r.userEmail == email) {
        _records[i] = ScoreRecord(
          userEmail: r.userEmail,
          userName: newName,
          categoryTitle: r.categoryTitle,
          score: r.score,
          total: r.total,
          date: r.date,
        );
      }
    }
    notifyListeners();
  }

  /// Riwayat milik satu akun, terbaru di atas.
  List<ScoreRecord> historyOf(String email) =>
      _records.where((r) => r.userEmail == email).toList().reversed.toList();

  /// Peringkat semua akun berdasarkan skor terbaik.
  List<LeaderboardEntry> get leaderboard {
    final best = <String, int>{};
    final plays = <String, int>{};
    final names = <String, String>{};
    for (final r in _records) {
      final old = best[r.userEmail] ?? 0;
      best[r.userEmail] = r.percent > old ? r.percent : old;
      plays[r.userEmail] = (plays[r.userEmail] ?? 0) + 1;
      names[r.userEmail] = r.userName;
    }
    final list = best.keys
        .map((email) => LeaderboardEntry(
      name: names[email]!,
      email: email,
      bestPercent: best[email]!,
      plays: plays[email]!,
    ))
        .toList();
    list.sort((a, b) => b.bestPercent.compareTo(a.bestPercent));
    return list;
  }
}