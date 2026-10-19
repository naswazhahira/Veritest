import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../../providers/quiz_provider.dart';
import '../../widgets/empty_state.dart';

class LeaderboardTab extends StatelessWidget {
  const LeaderboardTab({super.key});

  static const _medals = [
    Color(0xFFFFC107), // emas
    Color(0xFF9E9E9E), // perak
    Color(0xFFCD7F32), // perunggu
  ];

  @override
  Widget build(BuildContext context) {
    final me = context.watch<AuthProvider>().user.email;
    final entries = context.watch<QuizProvider>().leaderboard;
    final primary = Theme.of(context).colorScheme.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 12),
          child: Text('Peringkat',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
        ),
        Expanded(
          child: entries.isEmpty
              ? const EmptyState(
            icon: Icons.emoji_events_rounded,
            title: 'Belum ada peringkat',
            message: 'Selesaikan satu kuis untuk masuk ke papan peringkat.',
          )
              : ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: entries.length,
            itemBuilder: (_, i) {
              final e = entries[i];
              final isMe = e.email == me;
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: isMe
                      ? primary.withOpacity(0.15)
                      : Theme.of(context)
                      .colorScheme
                      .surface
                      .withOpacity(0.85),
                  borderRadius: BorderRadius.circular(18),
                  border: isMe
                      ? Border.all(color: primary, width: 1.5)
                      : null,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 36,
                      child: i < 3
                          ? Icon(Icons.emoji_events_rounded,
                          color: _medals[i])
                          : Text('${i + 1}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700)),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(isMe ? '${e.name} (kamu)' : e.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600)),
                          Text('${e.plays}x main',
                              style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                    Text('${e.bestPercent}%',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700)),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}