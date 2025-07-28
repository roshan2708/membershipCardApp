import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtaulmembershipcardapp/screens/MembershipScreen.dart';
import 'package:virtaulmembershipcardapp/themes/AppTheme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Virtual Membership Card',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.themeMode,
          home: const MembershipScreen(),
        );
      },
    );
  }
}