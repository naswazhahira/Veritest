import 'package:flutter/material.dart';

/// Latar gradient + pembatas lebar konten (adaptive untuk tablet / web).
class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key, required this.child, this.maxWidth = 640});

  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: dark
              ? const [Color(0xFF14112B), Color(0xFF0B1F26)]
              : const [Color(0xFFEDE9FF), Color(0xFFDDF6F2)],
        ),
      ),
      child: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: child,
          ),
        ),
      ),
    );
  }
}
