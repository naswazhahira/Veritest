import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class ExplanationBox extends StatelessWidget {
  const ExplanationBox({super.key, required this.isCorrect, required this.text});

  final bool isCorrect;
  final String text;

  @override
  Widget build(BuildContext context) {
    final color = isCorrect ? AppColors.correct : AppColors.wrong;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(isCorrect ? Icons.emoji_events_rounded : Icons.lightbulb_rounded,
              color: color),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isCorrect ? 'Jawabanmu benar!' : 'Belum tepat',
                  style: TextStyle(color: color, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 2),
                Text(text, style: const TextStyle(fontSize: 13, height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
