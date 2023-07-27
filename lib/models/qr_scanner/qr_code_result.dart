class QrCodeResult {
  final String username;
  final String password;

  QrCodeResult({
    required this.username,
    required this.password,
  });

  factory QrCodeResult.fromMap(Map<String, dynamic> map) {
    return QrCodeResult(
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }
}