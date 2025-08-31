import 'package:flutter/material.dart';
import 'package:flutter_spendybuddy/spends.dart';

var colorSchemeLight = ColorScheme.fromSeed(seedColor: Colors.redAccent);
var colorSchemeDark = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Colors.redAccent.shade700,
);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: colorSchemeLight,
        scaffoldBackgroundColor: colorSchemeLight.surfaceBright,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: colorSchemeLight.onPrimaryContainer,
          foregroundColor: colorSchemeLight.onPrimary,
        ),
        cardTheme: const CardThemeData().copyWith(
          color: colorSchemeLight.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorSchemeLight.primaryContainer,
          ),
        ),
      ),

      darkTheme: ThemeData.dark().copyWith(
        colorScheme: colorSchemeDark,
        scaffoldBackgroundColor: colorSchemeDark.surfaceBright,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: colorSchemeDark.onPrimaryContainer,
          foregroundColor: colorSchemeDark.onPrimary,
        ),
        cardTheme: const CardThemeData().copyWith(
          color: colorSchemeDark.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorSchemeDark.primaryContainer,
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const Spends(),
    ),
  );
}
