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
    required String username,
    required String email,
    required List workouts,
    required String userId,
    required String type, 
  }) async {
    UserModel user = UserModel(
      username: username, 
      email: email, 
      workouts: [], 
      workoutNum: 0, 
      userId: auth.currentUser!.uid, 
      type: "user",
    );

    //Add data from user to database
    await firestore
      .collection("users")
      .doc(auth.currentUser!.uid)
      .set(user.toMap());
  }
}