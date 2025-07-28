import 'package:flutter/material.dart';
import 'package:virtaulmembershipcardapp/screens/MembershipScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to MembershipScreen after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const MembershipScreen()),
      );
    });

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.card_membership,
              size: 100,
              color: Colors.white,
            ),
            const SizedBox(height: 16),
            Text(
              'Virtual Membership',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: Colors.white,
                    fontSize: 32,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}