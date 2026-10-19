import 'package:flutter/material.dart';

import '../models/score_record.dart';
import '../theme/app_theme.dart';

class HistoryTile extends StatelessWidget {
  const HistoryTile({super.key, required this.record});

  final ScoreRecord record;

  String _formatDate(DateTime d) {
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(d.day)}/${two(d.month)}/${d.year}  ${two(d.hour)}:${two(d.minute)}';
  }

  @override
  Widget build(BuildContext context) {
    final p = record.percent;
    final color = p >= 70
        ? AppColors.correct
        : p >= 50
        ? Colors.orange
        : AppColors.wrong;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.85),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Text('$p%',
                style: TextStyle(color: color, fontWeight: FontWeight.w700)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(record.categoryTitle,
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(_formatDate(record.date),
                    style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
          Text('${record.score}/${record.total}',
              style: const TextStyle(fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}