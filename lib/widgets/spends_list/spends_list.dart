import 'package:flutter/material.dart';
import 'package:flutter_spendybuddy/models/spend.dart';
import 'package:flutter_spendybuddy/widgets/spends_list/spend_item.dart';

class SpendsList extends StatelessWidget {
  const SpendsList({
    super.key,
    required this.spends,
    required this.removeSpend,
  });

  final List<Spend> spends;
  final void Function(Spend spend) removeSpend;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: spends.length,
      itemBuilder: (ctx, index) {
        return Dismissible(
          key: ValueKey(spends[index]),
          background: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.red.shade800,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.delete,
              color: Colors.black,
              size: 32,
            ),
          ),
          onDismissed: (direction) {
            removeSpend(spends[index]);
          },
          child: SpendItem(spends[index]),
        );
      },
    );
  }
}
