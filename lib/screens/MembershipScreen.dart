import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:virtaulmembershipcardapp/components/MembershipCard.dart';
import 'package:virtaulmembershipcardapp/components/RefreshButton.dart';
import 'package:virtaulmembershipcardapp/components/ThemedToggle.dart';
import 'package:virtaulmembershipcardapp/utils/QRGenerator.dart';
import '../constants/colors.dart';

class MembershipScreen extends StatefulWidget {
  const MembershipScreen({super.key});

  @override
  State<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  final List<Map<String, String>> users = [
    {'name': 'Alex Ray', 'level': 'Platinum Member', 'id': 'user-id-12345-abcde'},
    {'name': 'Emma Stone', 'level': 'Gold Member', 'id': 'user-id-67890-fghij'},
    {'name': 'Liam Carter', 'level': 'Silver Member', 'id': 'user-id-54321-klmno'},
    {'name': 'Sophie Lee', 'level': 'Platinum Member', 'id': 'user-id-09876-pqrst'},
    {'name': 'James Kim', 'level': 'Gold Member', 'id': 'user-id-11223-uvwxy'},
    {'name': 'Olivia Brown', 'level': 'Silver Member', 'id': 'user-id-44556-zabcd'},
    {'name': 'Noah Davis', 'level': 'Bronze Member', 'id': 'user-id-77889-efghi'},
    {'name': 'Ava Wilson', 'level': 'Platinum Member', 'id': 'user-id-99000-jklmn'},
    {'name': 'Ethan Moore', 'level': 'Gold Member', 'id': 'user-id-22334-opqrs'},
    {'name': 'Isabella Clark', 'level': 'Silver Member', 'id': 'user-id-55667-tuvwx'},
  ];

  List<String> qrDataList = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    qrDataList = users.map((user) => QRGenerator.generateQRData(user['id']!)).toList();
  }

  void refreshQRCode() {
    setState(() {
      qrDataList[_currentIndex] = QRGenerator.generateQRData(users[_currentIndex]['id']!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Membership Cards'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textLight,
        actions: const [ThemeToggle()],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.backgroundLight, AppColors.secondary.withOpacity(0.2)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 500.0,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlay: false,
                viewportFraction: 0.85,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: users.asMap().entries.map((entry) {
                int index = entry.key;
                Map<String, String> user = entry.value;
                return Builder(
                  builder: (BuildContext context) {
                    return MembershipCard(
                      userName: user['name']!,
                      membershipLevel: user['level']!,
                      qrData: qrDataList[index],
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            RefreshButton(onPressed: refreshQRCode),
          ],
        ),
      ),
    );
  }
}