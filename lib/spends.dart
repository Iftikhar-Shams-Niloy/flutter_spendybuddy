import "package:flutter/material.dart";
import 'package:flutter_spendybuddy/models/spend.dart';
import 'package:flutter_spendybuddy/widgets/chart/chart.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return screenHeight > screenWidth
            ? SizedBox(
                height: screenHeight * 2 / 3,
                width: screenWidth - 10,
                child: NewSpend(
                  onAddSpend: _addSpend,
                ),
              )
            : SizedBox(
                height: screenHeight,
                width: screenWidth,
                child: NewSpend(
                  onAddSpend: _addSpend,
                ),
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

  final List<Spend> _registeredSpends = [];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    Widget mainContent = Center(
      child: Text("No speding yet! Spend some money!😉"),
    );

    if (_registeredSpends.isNotEmpty) {
      mainContent = SpendsList(
        spends: _registeredSpends,
        removeSpend: _removeSpend,
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: screenHeight / screenWidth >= 1
          ? Column(
              children: [
                Chart(spends: _registeredSpends),
                SizedBox(
                  height: 6,
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(spends: _registeredSpends)),
                SizedBox(
                  height: 6,
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
