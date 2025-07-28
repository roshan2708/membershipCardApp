import 'package:flutter/material.dart';
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
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.accent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: AppColors.accent,
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
              const SizedBox(height: 16),
              Text(userName, style: Theme.of(context).textTheme.displayLarge),
              const SizedBox(height: 8),
              Text(membershipLevel, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 16),
              QrImageView(
                data: qrData,
                version: QrVersions.auto,
                size: 200.0,
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}