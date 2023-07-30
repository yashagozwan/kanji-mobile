import 'package:flutter/material.dart';

class CustomTheme {
  CustomTheme._();

  static ThemeData get theme {
    final theme = ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.red,
      fontFamily: 'Inter',
    );

    final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
    );

    final inputDecorationTheme = theme.inputDecorationTheme.copyWith(
      enabledBorder: outlineInputBorder.copyWith(
        borderSide: BorderSide(
          color: Colors.grey.shade200,
        ),
      ),
      border: outlineInputBorder,
    );

    final dialogTheme = theme.dialogTheme.copyWith(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: Colors.white,
    );

    var outlinedButtonTheme = OutlinedButtonThemeData(
      style: theme.outlinedButtonTheme.style?.copyWith(
        side: MaterialStatePropertyAll(
          BorderSide(
            color: theme.primaryColor,
          ),
        ),
      ),
    );

    return theme.copyWith(
      inputDecorationTheme: inputDecorationTheme,
      scaffoldBackgroundColor: Colors.grey.shade50,
      dialogTheme: dialogTheme,
      outlinedButtonTheme: outlinedButtonTheme,
    );
  }
}
