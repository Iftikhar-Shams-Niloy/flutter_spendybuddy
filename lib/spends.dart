import "package:flutter/material.dart";
import 'package:flutter_spendybuddy/models/spend.dart';
import 'package:flutter_spendybuddy/widgets/new_spend.dart';
import 'package:flutter_spendybuddy/widgets/spends_list/spends_list.dart';

class Spends extends StatefulWidget {
  const Spends({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SpendsState();
  }
}

class _SpendsState extends State<Spends> {
  void _oepnAddSpendOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return NewSpend();
      },
    );
  }

  final List<Spend> _registeredSpends = [
    Spend(
      title: "Test1",
      amount: 100,
      date: DateTime.now(),
      category: Category.fun,
    ),
    Spend(
      title: "Test2",
      amount: 200,
      date: DateTime.now(),
      category: Category.food,
    ),
    Spend(
      title: "Test3",
      amount: 50,
      date: DateTime.now(),
      category: Category.transport,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spendy Buddy"),
        actions: [
          IconButton(
            onPressed: _oepnAddSpendOverlay,
            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                Icons.add_circle_outline,
                size: 32,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Text("The Chart"),
          Expanded(
            child: SpendsList(spends: _registeredSpends),
          ),
        ],
      ),
    );
  }
}
