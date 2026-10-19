import 'package:flutter/material.dart';

import '../models/quiz_category.dart';
import 'question_bank.dart';

const List<QuizCategory> quizCategories = [
  QuizCategory(
    title: 'Flutter & Dart',
    description: 'Widget, state, dan dasar Dart',
    icon: Icons.flutter_dash_rounded,
    color: Color(0xFF6C4DFF),
    questions: flutterQuestions,
  ),
  QuizCategory(
    title: 'Pengetahuan Umum',
    description: 'Sejarah, alam, dan dunia',
    icon: Icons.public_rounded,
    color: Color(0xFF0EA5A4),
    questions: generalQuestions,
  ),
  QuizCategory(
    title: 'Matematika Dasar',
    description: 'Hitungan cepat dan geometri',
    icon: Icons.calculate_rounded,
    color: Color(0xFFF97316),
    questions: mathQuestions,
  ),
  QuizCategory(
    title: 'Teknologi',
    description: 'Web, OS, dan perangkat',
    icon: Icons.memory_rounded,
    color: Color(0xFFE11D74),
    questions: techQuestions,
  ),
];