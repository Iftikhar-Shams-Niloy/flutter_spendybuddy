import 'package:flutter/material.dart';
import 'package:flutter_spendybuddy/models/spend.dart';

class SpendItem extends StatelessWidget {
  const SpendItem(this.spend, {super.key});

  final Spend spend;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(spend.title),
            const SizedBox(height: 4),
            Row(
              children: [
                Text("Amount : ৳${spend.amount.toStringAsFixed(2)} "),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[spend.category]),
                    const SizedBox(width: 12),
                    Text(spend.dateFormatted),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
