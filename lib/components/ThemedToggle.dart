import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:virtaulmembershipcardapp/themes/AppTheme.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return IconButton(
      icon: FaIcon(
        themeProvider.themeMode == ThemeMode.light
            ? FontAwesomeIcons.moon
            : FontAwesomeIcons.sun,
        color: AppColors.secondary,
      ),
      onPressed: () {
        themeProvider.toggleTheme();
      },
    );
  }
}