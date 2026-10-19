import 'package:flutter/material.dart';

import '../screens/auth_gate.dart';
import '../screens/edit_profile_screen.dart';
import '../screens/quiz_screen.dart';
import '../screens/register_screen.dart';
import '../screens/result_screen.dart';

/// Semua nama route dan peta route aplikasi dikumpulkan di sini.
class AppRoutes {
  static const root = '/';
  static const register = '/register';
  static const quiz = '/quiz';
  static const result = '/result';
  static const editProfile = '/edit-profile';

  static final Map<String, WidgetBuilder> routes = {
    root: (_) => const AuthGate(),
    register: (_) => const RegisterScreen(),
    quiz: (_) => const QuizScreen(),
    result: (_) => const ResultScreen(),
    editProfile: (_) => const EditProfileScreen(),
  };
}