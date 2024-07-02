import 'package:flutter/material.dart';


// List<Widget> pageList = [
//   const WorkoutScreen(),
//   const StatScreen(),
//   const Profile(), 
// ];


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

    //Used as root of application, configure themes / routes
    /*return Scaffold(
      appBar: AppBar(

        


        backgroundColor: Colors.blue,
        title: const Text('Rizzy bear'),
      ),
        
      bottomNavigationBar: BottomNavigationBar(
            
        items: const [
    
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Workouts',
            
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.line_weight),
            label: 'Statistics',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.masks),
            label: 'Profile',
          ),

        ],

        onTap: (value) {
          if (value == 0) Navigator.pushNamed(context, '/WorkoutScreen');
          if (value == 1) Navigator.pushNamed(context, '/StatScreen');
          if (value == 2) Navigator.pushNamed(context, '/ProfileScreen');
        },

      )
         
        
      );*/

     return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                ),
                
                Tab(
                  icon: Icon(Icons.bar_chart),
                ),
                
                Tab(
                  icon: Icon(Icons.face),
                ),
              ],
            ),

            
          ),

          body: const TabBarView(
            children: [
              Icon(Icons.home),
              Icon(Icons.bar_chart),
              Icon(Icons.face),
            ],
          ),

        ),
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