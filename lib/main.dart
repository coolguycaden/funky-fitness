//import necessary packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:funkyfitness/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//import screens
import 'package:funkyfitness/features/auth/pages/login_page.dart';
import 'features/account/profile_view.dart';
import 'features/account/stat_view.dart';
import 'features/account/workout_view.dart';



void main() async {
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
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot) {
          if (!snapshot.hasData){
            return LoginPage();
          }

          return HomeScreen();
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      home: DefaultTabController(
        length: 3,
        
        child: Scaffold(
          bottomNavigationBar: homeRowBar(),
          
          body: TabBarView(
            children: [
              WorkoutView(),
              StatView(),
              ProfileView(),
            ],
          ),
        ),
        
      ),
    
    );
  
  }


  /*
    Precondition


    Postcondition  

  */
  
  Container homeRowBar() {
    return Container(
      decoration: const BoxDecoration(
        border: BorderDirectional(
          top: BorderSide(width: 1, color: Colors.black),
        ),
      ),

      child: const TabBar(
        tabs: [
          Tab(
            text: 'Workouts',
            icon: Icon(Icons.fitness_center),
          ),
          
          Tab(
            text: 'Statistics',
            icon: Icon(Icons.bar_chart),
          ),
          
          Tab(
            text: 'Profile',
            icon: Icon(Icons.face),
            
          ),
        ],
      ),
    );
  }
  


}
