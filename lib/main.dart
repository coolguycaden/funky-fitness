import 'package:flutter/material.dart';

void main(){
  runApp( const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const BaseApp(),
      routes: <String, WidgetBuilder> {

        '/WorkoutScreen' : (context) => const WorkoutScreen(),
        '/StatScreen' : (context) => const StatScreen(),
        '/ProfileScreen' : (context) => const ProfileScreen(),
        
      }
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
              Column(
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
              ),
            ],
          ),
        ),
        
      ),
    
    );
  
  }


  /*
  This is the extracted method of the homeRow
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

  BoxDecoration bottomWorkoutBorder() {
    return const BoxDecoration(
      border: BorderDirectional(
        bottom: BorderSide(width: 1, color: Colors.grey),
      ),
    );           
  }


}

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          backgroundColor: Colors.red,
          title: const Text('Welcome to Workouts!'),
      ),

    );
  }
}

class StatScreen extends StatelessWidget {
  const StatScreen({super.key});

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

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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