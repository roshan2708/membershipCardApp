class QRGenerator {
  static String generateQRData(String userId) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    return '$userId-$timestamp';
  }
}