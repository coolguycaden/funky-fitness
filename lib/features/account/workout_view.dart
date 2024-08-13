//import necessary packages
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//import necessary widgets
import 'package:funkyfitness/cores/widgets/exercise_bar.dart';
import 'package:funkyfitness/cores/decorations/bottom_box_border.dart';

class WorkoutView extends StatefulWidget {
  final String workoutName;
  final List exerciseList;

  WorkoutView({
    Key? key,
    required this.workoutName,
    required this.exerciseList,
  }): super(key: key);



  @override
  State<WorkoutView> createState() => new _WorkoutViewState();
}

class _WorkoutViewState extends State<WorkoutView> {

  //This holds number of exercises in a workout user has created 
  int _exerciseCount = 1;

  //Index holds location of last comma, used to split exerciseList into
  //individual exercises
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    Color lightPurple = Color.fromARGB(255, 206, 139, 218);

    
    List<Widget> _exercises = []; /*= 
      new List.generate(
        _exerciseCount, (int i) => new ExerciseBar(
          exerciseName: widget.exerciseList
            .substring(_index, 
              (_index += widget.exerciseList
              .substring(_index)
              .indexOf(',')
              )
            ),
            //.substring(_index, (_index += widget.exerciseList.indexOf(','))),

          setsAndReps: widget.exerciseList
            .substring(_index, 
              (_index += widget.exerciseList
              .substring(_index)
              .indexOf(',')
              )
            ),

          exerciseNotes: widget.exerciseList
            .substring(_index, 
              (_index += widget.exerciseList
              .substring(_index)
              .indexOf(',')
              )
            ),
        ));*/
      debugPrint();
    return new Scaffold(
      body: Column(
        children: [
          SafeArea(
            bottom: false,
            child: Row(
              children: [
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
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
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                  ),

                  Spacer(),
                  
                ],
              ),
            ),
          ),

          Column(
            children: _exercises,
          ),
        ],
      ),
    );
  }

  void debugPrint(){
    print(_index);
  }
}