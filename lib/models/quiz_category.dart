import 'package:flutter/material.dart';

import 'question.dart';

class QuizCategory {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final List<Question> questions;

  const QuizCategory({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.questions,
  });
}