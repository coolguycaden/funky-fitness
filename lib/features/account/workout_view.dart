//import necessary packages
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//import necessary widgets
import 'package:funkyfitness/cores/widgets/exercise_bar.dart';
import 'package:funkyfitness/cores/decorations/bottom_box_border.dart';

class WorkoutView extends StatefulWidget {
  //final VoidCallback nameChanged;
  final String workoutName;
  final List exerciseList;

  const WorkoutView({
    super.key,
    required this.workoutName,
    required this.exerciseList,
    //required this.nameChanged,
  });



  @override
  State<WorkoutView> createState() => _WorkoutViewState();
}

class _WorkoutViewState extends State<WorkoutView> {

  //This holds number of exercises in a workout user has created 
  final int _exerciseCount = 1;

  //Index holds location of last comma, used to split exerciseList into
  //individual exercises
  final int _index = 0;

  @override
  Widget build(BuildContext context) {
    Color lightPurple = const Color.fromARGB(255, 206, 139, 218);

    
    List<Widget> exercises = List.generate(
      _exerciseCount, (int i) => ExerciseBar(
        exerciseName: widget.exerciseList[i * 4], 
        setsAndReps: widget.exerciseList[(i * 4) + 1] + widget.exerciseList[(i * 4) + 2], 
        exerciseNotes: widget.exerciseList[(i * 4) + 3],
      )
    );

    //debugPrint();

    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            bottom: false,
            child: Row(
              children: [
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.angleLeft,
                          color: lightPurple,
                        ),
                        Text(
                          'Exercises',
                          style: TextStyle(
                            fontSize: 16,
                            color: lightPurple,
                          )
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),

          SafeArea(
            top: false,
            bottom: false, 

            child: Container(
              margin: const EdgeInsets.only(top: 3, left: 7,),
              decoration: bottomBoxBorder(),
              child: Row(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      
                      child: Text(
                        widget.workoutName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold, 
                          fontSize: 30
                        ),
                      ),
                    ),
                  ),

                  const Spacer(),
                  
                  
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        FontAwesomeIcons.ellipsis,
                        color: lightPurple,
                      ),
                    ),

                    onTap: () {
                      
                    },
                  ),
                ],
              ),
            ),
          ),

          Column(
            children: exercises,
          ),
        ],
      ),
    );
  }

  void debugPrint(){
    print(_index);
  }
}