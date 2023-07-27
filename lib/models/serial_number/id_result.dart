// ignore_for_file: public_member_api_docs, sort_constructors_first

class IDResult {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final int age;

  IDResult({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.age,
  });
  
  factory IDResult.fromMap(Map<String, dynamic> map) {
    return IDResult(
      id: map['id'],
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      age: map['age']
    );
  }
}
