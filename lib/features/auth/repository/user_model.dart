import 'dart:convert';


class UserModel {
  final String email;
  final List workouts;
  final int workoutNum;
  final String userId;
  //final String type;


  //JSON serialization from here to end of class
  UserModel({
    required this.email,
    required this.workoutNum,
    required this.workouts,
    required this.userId,
    //required this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'workouts': workouts,
      'workoutNum': workoutNum,
      'userId': userId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
      workouts: List<String>.from(
        map['subscriptions'] ?? [],
      ),
      workoutNum: map['workoutNum'] as int,
      userId: map['userId'] as String,
      //type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
