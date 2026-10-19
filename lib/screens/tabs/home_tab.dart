import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/quiz_categories.dart';
import '../../models/quiz_category.dart';
import '../../providers/auth_provider.dart';
import '../../providers/quiz_provider.dart';
import '../../widgets/category_card.dart';
import '../../widgets/user_avatar.dart';
import '../../routes/app_routes.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  void _open(BuildContext context, QuizCategory category) {
    final user = context.read<AuthProvider>().user;
    context.read<QuizProvider>().start(category, user);
    Navigator.of(context).pushNamed(AppRoutes.quiz);
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthProvider>().user;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
            child: Row(
              children: [
                UserAvatar(name: user.name, radius: 26),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Halo, ${user.name}! 👋',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      const Text('Pilih kuis yang ingin kamu coba'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 280,
              mainAxisExtent: 190,
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
            ),
            delegate: SliverChildBuilderDelegate(
                  (context, i) => CategoryCard(
                category: quizCategories[i],
                onTap: () => _open(context, quizCategories[i]),
              ),
              childCount: quizCategories.length,
            ),
          ),
        ),
      ],
    );
  }
}