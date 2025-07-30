import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:virtaulmembershipcardapp/constants/TextStyles.dart';
import 'package:virtaulmembershipcardapp/screens/MembershipScreen.dart';
import '../constants/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      if (context.mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const MembershipScreen()),
        );
      }
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.secondary.withOpacity(0.5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FaIcon(
                FontAwesomeIcons.idCard,
                size: 120,
                color: AppColors.textLight,
              ),
              const SizedBox(height: 20),
              Text(
                'Virtual Membership',
                style: AppTextStyles.heading.copyWith(
                  color: AppColors.textLight,
                  fontSize: 36,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}