import 'package:flutter/material.dart';

class Skill {
  final String id;
  final String name;
  final int proficiency; // 0-100
  final String? category;
  final IconData? icon;

  const Skill({
    required this.id,
    required this.name,
    required this.proficiency,
    this.category,
    this.icon,
  });
}
