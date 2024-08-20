//import necessary packages
import 'package:flutter/material.dart';

//import necessary decorations
import 'package:funkyfitness/cores/decorations/bottom_box_border.dart';
import 'package:funkyfitness/features/account/workout_view.dart';

class WorkoutBar extends StatefulWidget {
  final String currentWorkout;
  final String currentExercises;
  final Icon currentIcon;

  const WorkoutBar({
    super.key,
    required this.currentWorkout,
    required this.currentExercises,
    required this.currentIcon,
  });
  

  @override
  _WorkoutBarState createState() => _WorkoutBarState();
}

class _WorkoutBarState extends State<WorkoutBar> {
  Color lightPurple = const Color.fromARGB(255, 206, 139, 218);

  @override
  Widget build(BuildContext context) {
    //debugPrint(); 
    return SafeArea(
      top: false,

      child: GestureDetector(
        child: Container(
          margin: const EdgeInsets.only(left: 7,),
          decoration: bottomBoxBorder(),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 16, right: 30),
                child: Text(
                  widget.currentWorkout,
                  style: const TextStyle(
                    fontSize: 18
                  ), 
                ),
              ),

              const Spacer(),

              widget.currentIcon,
            ],
          ),
        ),

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WorkoutView(
                workoutName: widget.currentWorkout,
                exerciseList: widget.currentExercises.split(','),
              )
            ),
          );
        },
      ),
    );
  }
  
  void debugPrint() {
    print("\n\n");
    print(widget.currentExercises.split(','));
  }
}