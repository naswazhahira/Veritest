import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

enum OptionStatus { idle, correct, wrong, dimmed }

class OptionTile extends StatelessWidget {
  const OptionTile({
    super.key,
    required this.label,
    required this.text,
    required this.status,
    required this.onTap,
  });

  final String label;
  final String text;
  final OptionStatus status;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    Color border = cs.outlineVariant;
    Color fill = cs.surface.withOpacity(0.85);
    Color badge = cs.primaryContainer;
    Color badgeText = cs.onPrimaryContainer;
    IconData? icon;

    switch (status) {
      case OptionStatus.correct:
        border = AppColors.correct;
        fill = AppColors.correct.withOpacity(0.15);
        badge = AppColors.correct;
        badgeText = Colors.white;
        icon = Icons.check_circle_rounded;
        break;
      case OptionStatus.wrong:
        border = AppColors.wrong;
        fill = AppColors.wrong.withOpacity(0.15);
        badge = AppColors.wrong;
        badgeText = Colors.white;
        icon = Icons.cancel_rounded;
        break;
      case OptionStatus.dimmed:
        fill = cs.surface.withOpacity(0.45);
        break;
      case OptionStatus.idle:
        break;
    }

    final radius = BorderRadius.circular(18);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: fill,
          borderRadius: radius,
          border: Border.all(color: border, width: 2),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: radius,
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: 36,
                    height: 36,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: badge, shape: BoxShape.circle),
                    child: Text(
                      label,
                      style: TextStyle(
                        color: badgeText,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      text,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  if (icon != null) Icon(icon, color: border),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
