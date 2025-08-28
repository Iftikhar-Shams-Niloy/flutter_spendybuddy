import 'package:flutter/material.dart';
import 'package:flutter_spendybuddy/spends.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Spends(),
    ),
  );
}
