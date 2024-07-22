//import necessary packages
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//import necessary decorations
import 'package:funkyfitness/cores/decorations/bottom_workout_border.dart';

//import necessary widgets
import 'package:funkyfitness/cores/widgets/workout_bar.dart';


class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => 
    new _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  
  //Make this take user data as initial value
  int _count = 1;


  @override
  Widget build(BuildContext context) {

    //This holds number of workouts user has created 
    List<Widget> _workouts = 
      new List.generate(_count, (int i) => new WorkoutBar());

    return Column(
      children: [
        SafeArea(
          bottom: false,
          
          child: Row(
            children: [
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.only(left: 7),
                  child: Text(
                    'Edit',
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                onTap: () {
                  
                },
              ),

              Spacer(),

              IconButton(
                icon: Icon(
                  FontAwesomeIcons.plus,
                  color: Colors.lightBlue,
                ),
                onPressed: () {
                  _addNewWorkoutView();
                },
              ),
            ]
          ),
        ),


        SafeArea(
          top: false,
          bottom: false, 

          child: Container(
            margin: const EdgeInsets.only(top: 15, left: 7,),
            decoration: bottomWorkoutBorder(),
            child: Row(
              children: [
                Container(
                  child: const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    
                    child: Text(
                      'Workouts',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                    ),
                  ),
                ),

                Spacer(),
                
              ],
            ),
          ),
        ),

        Column (
          children: _workouts,
        ),
      ],
    );
  }
  
  void _addNewWorkoutView() {
    setState(() {
      //Add ability to update user data in database
      _count = _count + 1;
    });
  }

}