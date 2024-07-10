import 'package:firebase_core/firebase_core.dart';
import 'package:funkyfitness/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()));
  //runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    
    return const MaterialApp(
      home: BaseApp(),
  
    );
  }
}
class BaseApp extends StatelessWidget {
  const BaseApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,

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

class WorkoutView extends StatefulWidget {
  const WorkoutView({super.key});

  @override
  State<WorkoutView> createState() => _WorkoutViewState();
}

class _WorkoutViewState extends State<WorkoutView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          toolbarHeight: 80,
          title: Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(top: 20, left: 2,),
                decoration: bottomWorkoutBorder(),
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  
                  child: Text(
                    'Workouts',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                ),
              ),
            ),
          ),
        ),

        Row (
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/WorkoutScreen');
              },
              
              child: Container(
                margin: const EdgeInsets.only(left: 20,),
                decoration: bottomWorkoutBorder(),
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 20, top: 16, right: 30),
                  child: Text(
                    'A workout',
                    style: TextStyle(
                      fontSize: 18
                    ), 
                  ),
                ),
              ),
            ),
          ],
        ),
    ],
  );
}
  
  BoxDecoration bottomWorkoutBorder() {
    return const BoxDecoration(
      border: BorderDirectional(
        bottom: BorderSide(width: 1, color: Colors.grey),
      ),
    );           
  }

}

class StatView extends StatelessWidget {
  const StatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          backgroundColor: Colors.green,
          title: const Text('Welcome to Stats!'),
      ),

    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          backgroundColor: Colors.blue,
          title: const Text('Welcome to Profile!'),
        ),

    );
  }
}