import 'dart:convert';


class UserModel {
  final String email;
  final List workouts;
  final String userId;

  //JSON serialization from here to end of class
  UserModel({
    required this.email,
    required this.workouts,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'workouts': workouts,
      'userId': userId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
      workouts: List<String>.from(
        map['workouts'] ?? [],
      ),
      userId: map['userId'] as String,
      //type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
