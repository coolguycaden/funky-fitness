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
                    title: Container(
                      margin: const EdgeInsets.only(top: 20, left: 8),
                      child: const Text(
                        'Workout View',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                        
                      ),
                    ),
                  ),

                  Row (
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 8, left: 8),
                        child: TextButton(
                          child: const Text('A workout'),
                          onPressed: () {
                            Navigator.pushNamed(context, '/WorkoutScreen');
                          },
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
  TabBar homeRowBar() {
    return const TabBar(
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

      
      /*onTap: (value) {
        if (value == 0) Navigator.pushNamed(context, '/WorkoutScreen'); 
        if (value == 1) Navigator.pushNamed(context, '/StatScreen');
        if (value == 2) Navigator.pushNamed(context, '/ProfileScreen');
  
      },*/
          
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