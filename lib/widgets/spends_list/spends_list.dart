import 'package:flutter/material.dart';
import 'package:flutter_spendybuddy/models/spend.dart';
import 'package:flutter_spendybuddy/widgets/spends_list/spend_item.dart';

class SpendsList extends StatelessWidget {
  const SpendsList({super.key, required this.spends});

  final List<Spend> spends;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: spends.length,
      itemBuilder: (ctx, index) {
        return SpendItem(spends[index]);
      },
    );
  }
}
