//import necessary packages
import 'package:flutter/material.dart';

//import necessary widgets
import 'package:funkyfitness/cores/widgets/home_row_bar.dart';

//import necessary screens
import 'package:funkyfitness/cores/screens/profile_screen.dart';
import 'package:funkyfitness/cores/screens/stat_screen.dart';
import 'package:funkyfitness/cores/screens/all_workouts_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      //Set theme to dark mode
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,

      home: DefaultTabController(
        length: 3,
        
        child: Scaffold(
          bottomNavigationBar: homeRowBar(),
          
          body: const TabBarView(
            children: [
              all_workouts_screen(),
              StatView(),
              ProfileView(),
            ],
          ),
        ),
        
      ),
    
    );
  
  }
}
