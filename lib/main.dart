//import necessary packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:funkyfitness/features/auth/repository/user_data_service.dart';
import 'package:funkyfitness/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//import screens
import 'package:funkyfitness/features/auth/pages/login_page.dart';
import 'cores/screens/home_screen.dart';

//import necessary widgets
import 'package:funkyfitness/cores/widgets/loader.dart';

void main() async {

  //Initialize firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context, WidgetRef ref){
    return MaterialApp(

      //Set theme to dark mode
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,


      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot) {

          //If user is not signed it, get them to sign in
          if (!snapshot.hasData){

            return LoginPage();
          } else if(snapshot.connectionState == ConnectionState.waiting){
            return Loader();
          
          }

          return StreamBuilder(
            stream: FirebaseFirestore.instance
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),

            builder: (context, snapshot) {
              final user = FirebaseAuth.instance.currentUser;
              if(!snapshot.hasData || !snapshot.data!.exists){
                
                //add generic data if user does not exist or user data not in firebase
                /*ref
                  .read(userDataServiceProvider)
                  .addUserDataToFirestore(
                    email: user!.email!,
                    workouts: ["Upper Body, Chest Press, 3, 10, Add notes here!,", "Lower Body, Leg Press, 3, 10, Add notes here!,"],
                    userId: user.uid,
                  );
                */
                print("\n\nnew user joined\n\n");
                return HomeScreen();
              } else if (snapshot.connectionState == ConnectionState.waiting){
                return Loader();
              }

              return HomeScreen();
            },
          );
        }
      ),
    );
  }
}
