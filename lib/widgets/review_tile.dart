import 'package:flutter/material.dart';

import '../models/question.dart';
import '../theme/app_theme.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({
    super.key,
    required this.number,
    required this.question,
    required this.userAnswer,
  });

  final int number;
  final Question question;
  final int? userAnswer;

  @override
  Widget build(BuildContext context) {
    final correct = userAnswer == question.answerIndex;
    final color = correct ? AppColors.correct : AppColors.wrong;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.85),
        borderRadius: BorderRadius.circular(16),
        border: Border(left: BorderSide(color: color, width: 5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$number. ${question.text}',
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
          const SizedBox(height: 6),
          Text(
            'Jawabanmu: ${userAnswer == null ? '-' : question.options[userAnswer!]}',
            style: TextStyle(color: color, fontSize: 12),
          ),
          if (!correct)
            Text('Jawaban benar: ${question.options[question.answerIndex]}',
                style: const TextStyle(color: AppColors.correct, fontSize: 12)),
        ],
      ),
    );
  }
}
