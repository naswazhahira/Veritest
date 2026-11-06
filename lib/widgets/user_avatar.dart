import 'package:flutter/material.dart';

import '../utils/avatars.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.name,
    this.radius = 20,
    this.avatarIndex,
    this.zoom = 1.35,
  });

  final String name;
  final double radius;
  final int? avatarIndex;
  final double zoom;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final i = avatarIndex;

    final initials = CircleAvatar(
      radius: radius,
      backgroundColor: primary,
      child: Text(
        name.trim().isEmpty ? '?' : name.trim()[0].toUpperCase(),
        style: TextStyle(
          color: Colors.white,
          fontSize: radius * 0.9,
          fontWeight: FontWeight.w700,
        ),
      ),
    );

    if (i == null || i < 0 || i >= avatarAssets.length) return initials;

    final size = radius * 2;
    return ClipOval(
      child: SizedBox(
        width: size,
        height: size,
        child: Transform.scale(
          scale: zoom,
          child: Image.asset(
            avatarAssets[i],
            width: size,
            height: size,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => initials,
          ),
        ),
      ),
    );
  }
}