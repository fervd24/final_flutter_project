// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String email;
  final String password;
  
  UserModel({
    required this.email,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'], 
      password: json['model'], 
    );
  }
}
