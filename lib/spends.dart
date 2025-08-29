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
  void _openAddSpendOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return NewSpend(
          onAddSpend: _addSpend,
        );
      },
    );
  }

  void _addSpend(Spend spend) {
    setState(() {
      _registeredSpends.add(spend);
    });
  }

  void _removeSpend(Spend spend) {
    final spendIndex = _registeredSpends.indexOf(spend);
    setState(() {
      _registeredSpends.remove(spend);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content: const Text("Expense Deleted!"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registeredSpends.insert(spendIndex, spend);
            });
          },
        ),
      ),
    );
  }

  final List<Spend> _registeredSpends = [
    Spend(
      title: "Test1",
      amount: 100,
      date: DateTime.now(),
      category: SpendCategory.fun,
    ),
    Spend(
      title: "Test2",
      amount: 200,
      date: DateTime.now(),
      category: SpendCategory.food,
    ),
    Spend(
      title: "Test3",
      amount: 50,
      date: DateTime.now(),
      category: SpendCategory.transport,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text("No speding yet!. Spend some money!😉"),
    );

    if (_registeredSpends.isNotEmpty) {
      mainContent = SpendsList(
        spends: _registeredSpends,
        removeSpend: _removeSpend,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Spendy Buddy"),
        actions: [
          IconButton(
            onPressed: _openAddSpendOverlay,
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
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
