import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, transport, fun, work, others }

final dateFormatter = DateFormat.yMd();

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.transport: Icons.emoji_transportation,
  Category.fun: Icons.emoji_emotions_outlined,
  Category.work: Icons.work_outline_rounded,
  Category.others: Icons.devices_other_rounded,
};

class Spend {
  Spend({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get dateFormatted {
    return dateFormatter.format(date);
  }
}
