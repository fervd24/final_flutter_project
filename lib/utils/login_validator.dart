class LoginValidator {
  static bool isEmailValid(String email) {
    RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'); 
    return emailRegex.hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    // RegExp passwordRegex = RegExp(
    //   r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    //   );
    return password.length > 6;
  }
}