import 'package:flutter/material.dart';
import 'package:virtaulmembershipcardapp/themes/AppTheme.dart';
import 'package:provider/provider.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return IconButton(
      icon: Icon(
        themeProvider.themeMode == ThemeMode.light
            ? Icons.dark_mode
            : Icons.light_mode,
      ),
      onPressed: () {
        themeProvider.toggleTheme();
      },
    );
  }
}