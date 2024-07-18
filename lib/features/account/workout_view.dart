//import necessary packages

import 'package:flutter/material.dart';
import 'package:funkyfitness/main.dart';

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