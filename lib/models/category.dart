import 'package:flutter/material.dart';

class Category {
  final int id;
  final String title;
  final Color backColor;

  Category({
    required this.id,
    required this.title,
    this.backColor = Colors.red,
  });
}
