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
    return Scaffold(
        appBar: AppBar(

          


          backgroundColor: Colors.blue,
          title: const Text('Rizzy bear'),
        ),

      body: Container(
          
          margin: const EdgeInsets.all(100),
          padding: const EdgeInsets.all(10),
          color: Colors.red,
          height: 100,
          width: 100,

          /*Extra customization options
          decoration: const BoxDecoration(

          ),*/

          child: const Text('Floating'),
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