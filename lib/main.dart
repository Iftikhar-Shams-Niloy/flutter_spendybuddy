import 'package:flutter/material.dart';
import 'package:flutter_spendybuddy/spends.dart';

var colorSchemeMain1 = ColorScheme.fromSeed(seedColor: Colors.redAccent);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: colorSchemeMain1,
        scaffoldBackgroundColor: colorSchemeMain1.surfaceBright,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: colorSchemeMain1.onPrimaryContainer,
          foregroundColor: colorSchemeMain1.onPrimary,
        ),
        cardTheme: const CardThemeData().copyWith(
          color: colorSchemeMain1.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorSchemeMain1.primaryContainer,
          ),
        ),
      ),
      home: const Spends(),
    ),
  );
}
