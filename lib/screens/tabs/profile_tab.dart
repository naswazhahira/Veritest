import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../../providers/quiz_provider.dart';
import '../../providers/theme_provider.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_theme.dart';
import '../../widgets/stat_card.dart';
import '../../widgets/user_avatar.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  Future<void> _confirmLogout(BuildContext context) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Keluar dari akun?'),
        content: const Text('Kamu bisa masuk lagi kapan saja.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Keluar'),
          ),
        ],
      ),
    );
    if (ok == true && context.mounted) {
      context.read<AuthProvider>().logout();
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthProvider>().user;
    final records = context.watch<QuizProvider>().historyOf(user.email);
    context.watch<ThemeProvider>(); // rebuild saat tema berubah
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final played = records.length;
    final best = records.isEmpty
        ? 0
        : records.map((r) => r.percent).reduce((a, b) => a > b ? a : b);
    final avg = records.isEmpty
        ? 0
        : (records.map((r) => r.percent).reduce((a, b) => a + b) /
        records.length)
        .round();

    final cardColor = Theme.of(context).colorScheme.surface.withOpacity(0.85);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          UserAvatar(name: user.name, radius: 44),
          const SizedBox(height: 12),
          Text(user.name,
              style:
              const TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
          Text(user.email),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: () {
              debugPrint('Edit Profil ditekan');
              Navigator.of(context).pushNamed(AppRoutes.editProfile);
            },
            icon: const Icon(Icons.edit_rounded, size: 18),
            label: const Text('Edit Profil'),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: StatCard(
                    icon: Icons.sports_esports_rounded,
                    label: 'Dimainkan',
                    value: '$played',
                    color: AppColors.primary),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatCard(
                    icon: Icons.emoji_events_rounded,
                    label: 'Terbaik',
                    value: '$best%',
                    color: Colors.orange),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatCard(
                    icon: Icons.analytics_rounded,
                    label: 'Rata-rata',
                    value: '$avg%',
                    color: AppColors.accent),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.settings_rounded, size: 20),
                    SizedBox(width: 8),
                    Text('Pengaturan',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                  ],
                ),
                const SizedBox(height: 12),
                const Text('Tema tampilan', style: TextStyle(fontSize: 13)),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: SegmentedButton<ThemeMode>(
                    showSelectedIcon: false,
                    style: const ButtonStyle(
                      visualDensity: VisualDensity.compact,
                      textStyle:
                      WidgetStatePropertyAll(TextStyle(fontSize: 13)),
                    ),
                    segments: const [
                      ButtonSegment(
                        value: ThemeMode.light,
                        icon: Icon(Icons.light_mode_rounded, size: 18),
                        label: Text('Terang'),
                      ),
                      ButtonSegment(
                        value: ThemeMode.dark,
                        icon: Icon(Icons.dark_mode_rounded, size: 18),
                        label: Text('Gelap'),
                      ),
                    ],
                    selected: {isDark ? ThemeMode.dark : ThemeMode.light},
                    onSelectionChanged: (s) =>
                        context.read<ThemeProvider>().setMode(s.first),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => _confirmLogout(context),
              icon: const Icon(Icons.logout_rounded),
              label: const Text('Keluar'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.wrong,
                side: const BorderSide(color: AppColors.wrong),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}