import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../../providers/quiz_provider.dart';
import '../../widgets/empty_state.dart';
import '../../widgets/history_tile.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    final email = context.watch<AuthProvider>().user.email;
    final records = context.watch<QuizProvider>().historyOf(email);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
          child: Row(
            children: [
              Image.asset(
                'assets/images/V.png',
                height: 32,
                width: 32,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 10),
              const Text(
                'Riwayat',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        Expanded(
          child: records.isEmpty
              ? const EmptyState(
            icon: Icons.quiz_rounded,
            title: 'Belum ada riwayat',
            message: 'Mainkan kuis dari Beranda, hasilnya akan muncul di sini.',
          )
              : ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: records.length,
            itemBuilder: (_, i) => HistoryTile(record: records[i]),
          ),
        ),
      ],
    );
  }
}