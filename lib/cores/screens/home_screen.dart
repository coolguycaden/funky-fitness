//import necessary packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//import necessary widgets
import 'package:funkyfitness/cores/widgets/home_row_bar.dart';

//import necessary screens
import 'package:funkyfitness/cores/screens/profile_screen.dart';
import 'package:funkyfitness/cores/screens/stat_screen.dart';
import 'package:funkyfitness/cores/screens/workout_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          
          body: TabBarView(
            children: [
              WorkoutScreen(),
              StatView(),
              ProfileView(),
            ],
          ),
        ),
        
      ),
    
    );
  
  }
}
