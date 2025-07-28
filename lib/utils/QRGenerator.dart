class QRGenerator {
  static String generateQRData() {
    final baseUserId = 'user-id-12345-abcde';
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    return '$baseUserId-$timestamp';
  }
}