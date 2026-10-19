import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class ScoreRing extends StatelessWidget {
  const ScoreRing({
    super.key,
    required this.score,
    required this.total,
    required this.size,
  });

  final int score;
  final int total;
  final double size;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: total == 0 ? 0 : score / total),
            duration: const Duration(milliseconds: 1200),
            curve: Curves.easeOutCubic,
            builder: (context, value, _) => SizedBox(
              width: size,
              height: size,
              child: CircularProgressIndicator(
                value: value,
                strokeWidth: size * 0.09,
                strokeCap: StrokeCap.round,
                backgroundColor: cs.primary.withOpacity(0.15),
                color: AppColors.accent,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${total == 0 ? 0 : (score * 100 / total).round()}',
                style: TextStyle(
                  fontSize: size * 0.28,
                  fontWeight: FontWeight.w700,
                  height: 1,
                ),
              ),
              Text('$score / $total benar', style: TextStyle(fontSize: size * 0.08)),
            ],
          ),
        ],
      ),
    );
  }
}
