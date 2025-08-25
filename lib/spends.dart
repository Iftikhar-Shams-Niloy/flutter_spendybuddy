import "package:flutter/material.dart";

class Spends extends StatefulWidget {
  const Spends({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SpendsState();
  }
}

class _SpendsState extends State<Spends> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("The Chart"),
          Text("Expense List..."),
        ],
      ),
    );
  }
}
