import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum SpendCategory { food, transport, fun, work, others }

final dateFormatter = DateFormat.yMd();

const categoryIcons = {
  SpendCategory.food: Icons.lunch_dining,
  SpendCategory.transport: Icons.emoji_transportation,
  SpendCategory.fun: Icons.emoji_emotions_outlined,
  SpendCategory.work: Icons.work_outline_rounded,
  SpendCategory.others: Icons.devices_other_rounded,
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
  final SpendCategory category;

  String get dateFormatted {
    return dateFormatter.format(date);
  }
}

class SpendBucket {
  const SpendBucket({
    required this.spendCategory,
    required this.spends,
  });

  SpendBucket.forSpendCategory(List<Spend> allSpends, this.spendCategory)
    : spends = allSpends
          .where((spend) => spend.category == spendCategory)
          .toList();

  final SpendCategory spendCategory;
  final List<Spend> spends;

  double get totalSpends {
    double sum = 0;
    for (final spend in spends) {
      sum += spend.amount;
    }
    return sum;
  }
}
