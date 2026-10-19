import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/gradient_background.dart';
import '../widgets/primary_button.dart';
import '../widgets/review_tile.dart';
import '../widgets/score_ring.dart';
import '../widgets/stat_tile.dart';
import '../routes/app_routes.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  String _message(double percent) {
    if (percent >= 0.9) return 'Luar biasa! Kamu jagoan Flutter 🏆';
    if (percent >= 0.7) return 'Keren! Pemahamanmu sudah kuat 🎉';
    if (percent >= 0.5) return 'Lumayan! Sedikit lagi belajar ya 💪';
    return 'Jangan menyerah, coba lagi! 📚';
  }

  void _replay(BuildContext context, QuizProvider quiz) {
    quiz.replay();
    Navigator.of(context).pushReplacementNamed(AppRoutes.quiz);
  }

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final percent = quiz.total == 0 ? 0.0 : quiz.score / quiz.total;
    final size = MediaQuery.sizeOf(context);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) {
          Navigator.of(context).popUntil(ModalRoute.withName(AppRoutes.root));
        }
      },
      child: Scaffold(
        body: GradientBackground(
          maxWidth: 960,
          child: LayoutBuilder(
            builder: (context, c) {
              final wide = c.maxWidth >= 800;
              final ringSize = (size.shortestSide * 0.5).clamp(150.0, 240.0);

              final summary = Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Halo, ${quiz.userName}!',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w700)),
              Text(quiz.categoryTitle, style: const TextStyle(fontSize: 13)),
              const SizedBox(height: 4),
                  Text(_message(percent), textAlign: TextAlign.center),
                  const SizedBox(height: 24),
                  ScoreRing(score: quiz.score, total: quiz.total, size: ringSize),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: StatTile(
                            icon: Icons.check_circle_rounded,
                            label: 'benar',
                            value: '${quiz.score}',
                            color: AppColors.correct),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: StatTile(
                            icon: Icons.cancel_rounded,
                            label: 'salah',
                            value: '${quiz.wrong}',
                            color: AppColors.wrong),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      label: 'Main Lagi',
                      icon: Icons.replay_rounded,
                      onPressed: () => _replay(context, quiz),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextButton.icon(
                    onPressed: () => Navigator.of(context)
                        .popUntil(ModalRoute.withName(AppRoutes.root)),
                    icon: const Icon(Icons.home_rounded),
                    label: const Text('Kembali ke Beranda'),
                  ),
                ],
              );

              final review = Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Pembahasan',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 10),
                  for (var i = 0; i < quiz.total; i++)
                    ReviewTile(
                      number: i + 1,
                      question: quiz.questions[i],
                      userAnswer: quiz.answers[i],
                    ),
                ],
              );

              return SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: wide
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: summary),
                          const SizedBox(width: 32),
                          Expanded(child: review),
                        ],
                      )
                    : Column(children: [
                        summary,
                        const SizedBox(height: 24),
                        review,
                      ]),
              );
            },
          ),
        ),
      ),
    );
  }
}
