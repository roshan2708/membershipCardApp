import 'package:flutter/material.dart';

class RefreshButton extends StatelessWidget {
  final VoidCallback onPressed;

  const RefreshButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.refresh),
      label: const Text('Refresh QR Code'),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    );
  }
}