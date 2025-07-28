import 'package:flutter/material.dart';
import 'package:virtaulmembershipcardapp/components/MembershipCard.dart';
import 'package:virtaulmembershipcardapp/components/RefreshButton.dart';
import 'package:virtaulmembershipcardapp/components/ThemedToggle.dart';
import 'package:virtaulmembershipcardapp/utils/QRGenerator.dart';

class MembershipScreen extends StatefulWidget {
  const MembershipScreen({super.key});

  @override
  State<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  String qrData = QRGenerator.generateQRData();

  void refreshQRCode() {
    setState(() {
      qrData = QRGenerator.generateQRData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Membership Card'),
        actions: const [ThemeToggle()],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MembershipCard(
              userName: 'Alex Ray',
              membershipLevel: 'Platinum Member',
              qrData: qrData,
            ),
            const SizedBox(height: 16),
            RefreshButton(onPressed: refreshQRCode),
          ],
        ),
      ),
    );
  }
}