//import necessary packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:funkyfitness/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//import screens
import 'package:funkyfitness/features/auth/pages/login_page.dart';
import 'cores/screens/home_screen.dart';
import 'package:funkyfitness/features/auth/pages/username_page.dart';



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
          }

          return HomeScreen();
        },
      ),
    );
  }
}
