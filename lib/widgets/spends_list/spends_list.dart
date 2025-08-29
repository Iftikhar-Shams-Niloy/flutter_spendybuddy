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
          onDismissed: (direction) {
            removeSpend(spends[index]);
          },
          child: SpendItem(spends[index]),
        );
      },
    );
  }
}
