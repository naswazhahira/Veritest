import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';
import '../widgets/explanation_box.dart';
import '../widgets/gradient_background.dart';
import '../widgets/option_tile.dart';
import '../widgets/primary_button.dart';
import '../widgets/progress_header.dart';
import '../widgets/question_card.dart';
import '../routes/app_routes.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  Future<bool?> _confirmExit(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Keluar dari kuis?'),
        content: const Text('Progres kuis ini akan hilang.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Lanjut main')),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Keluar')),
        ],
      ),
    );
  }

  OptionStatus _statusFor(QuizProvider quiz, int i) {
    if (!quiz.isAnswered) return OptionStatus.idle;
    if (i == quiz.currentQuestion.answerIndex) return OptionStatus.correct;
    if (i == quiz.selectedAnswer) return OptionStatus.wrong;
    return OptionStatus.dimmed;
  }

  void _onNext(BuildContext context, QuizProvider quiz) {
    if (quiz.isLast) {
      quiz.finish();
      Navigator.of(context).pushReplacementNamed(AppRoutes.result);
    } else {
      quiz.next();
    }
  }

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final q = quiz.currentQuestion;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        final ok = await _confirmExit(context);
        if (ok == true && context.mounted) Navigator.of(context).pop();
      },
      child: Scaffold(
        body: GradientBackground(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                ProgressHeader(
                  current: quiz.currentIndex + 1,
                  total: quiz.total,
                  score: quiz.score,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Column(
                        key: ValueKey(quiz.currentIndex),
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          QuestionCard(
                              number: quiz.currentIndex + 1, text: q.text),
                          for (var i = 0; i < q.options.length; i++)
                            OptionTile(
                              label: String.fromCharCode(65 + i),
                              text: q.options[i],
                              status: _statusFor(quiz, i),
                              onTap: quiz.isAnswered ? null : () => quiz.select(i),
                            ),
                          if (quiz.isAnswered) ...[
                            const SizedBox(height: 4),
                            ExplanationBox(
                              isCorrect: quiz.selectedAnswer == q.answerIndex,
                              text: q.explanation,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                    label: quiz.isLast ? 'Lihat Hasil' : 'Soal Berikutnya',
                    icon: quiz.isLast
                        ? Icons.flag_rounded
                        : Icons.arrow_forward_rounded,
                    onPressed:
                        quiz.isAnswered ? () => _onNext(context, quiz) : null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
