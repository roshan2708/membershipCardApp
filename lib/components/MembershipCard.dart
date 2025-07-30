import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../constants/colors.dart';

class MembershipCard extends StatelessWidget {
  final String userName;
  final String membershipLevel;
  final String qrData;

  const MembershipCard({
    super.key,
    required this.userName,
    required this.membershipLevel,
    required this.qrData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.accent.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.secondary, width: 3),
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.secondary,
                  child: FaIcon(
                    FontAwesomeIcons.user,
                    size: 50,
                    color: AppColors.textLight,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                userName,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: AppColors.textLight,
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                membershipLevel,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textDark,
                    ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: QrImageView(
                  data: qrData,
                  version: QrVersions.auto,
                  size: 200.0,
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.all(12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}