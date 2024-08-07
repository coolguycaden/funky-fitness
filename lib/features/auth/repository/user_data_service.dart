import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:funkyfitness/features/auth/repository/user_model.dart';


final userDataServiceProvider = Provider(
  (ref) => UserDataService(
    auth: FirebaseAuth.instance, 
    firestore: FirebaseFirestore.instance,
  ),
);

class UserDataService {
  FirebaseAuth auth;
  FirebaseFirestore firestore;

  UserDataService({
    required this.auth,
    required this.firestore,
  });


  addUserDataToFirestore({
    required String email,
    required List workouts,
    required int workoutNum,
    required String userId,

  }) async {
    UserModel user = UserModel(
      email: email, 
      workouts: ["Upper Body, Chest Press, 3, 10,", "Lower Body, Leg Press, 3, 10"], 
      workoutNum: 2, 
      userId: auth.currentUser!.uid, 
      
    );

    //Add data from user to database
    await firestore
      .collection("users")
      .doc(auth.currentUser!.uid)
      .set(user.toMap());
  }

  Future<UserModel> fetchUserData() async {
    final userMap = 
      await firestore.collection("users").doc(auth.currentUser!.uid).get();

    UserModel user = UserModel.fromMap(userMap.data()!);

    return user;
  }
}