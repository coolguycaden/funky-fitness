//import necessary packages
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//import necessary decorations
import 'package:funkyfitness/cores/decorations/bottom_box_border.dart';
import 'package:funkyfitness/features/account/exercise_view.dart';

class ExerciseBar extends StatefulWidget {
  final String exerciseName;
  final String setsAndReps;
  final String exerciseNotes;

  const ExerciseBar({
    super.key,
    required this.exerciseName,
    required this.setsAndReps,
    required this.exerciseNotes,
  });

  @override
  State<ExerciseBar> createState() => _ExerciseBarState();
}

class _ExerciseBarState extends State<ExerciseBar> {

  @override
  Widget build(BuildContext context) {
    Color lightPurple = const Color.fromARGB(255, 206, 139, 218);

    return SafeArea(
      top: false,

      child: GestureDetector(
        child: Container(
          margin: const EdgeInsets.only(left: 7,),
          decoration: bottomBoxBorder(),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, right: 30),
                        child: Text(
                          widget.exerciseName.trimLeft(),
                          style: const TextStyle(
                            fontSize: 21,
                          ), 
                        ),
                      ),
                      
                      const Spacer(),

                      Padding(
                        padding: const EdgeInsets.only(top: 30, right: 10),
                        child: Icon(
                          FontAwesomeIcons.angleRight, 
                          size: 20,
                          color: lightPurple,
                        ),
                      )
                    ],
                  ),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20,),
                        child: Text(
                          "${widget.setsAndReps.trimLeft().substring(0, 1)} sets",
                          style: const TextStyle(
                            fontSize: 17,
                          ), 
                        ),
                      ),

                      const Spacer(),
                    ]
                  ),
                ],
              ),
            ],
          ),
        ),


        onTap: () async {
          await showDialog<void>(
            context: context, 
            builder: (context) => const AlertDialog(
              content: ExerciseView(),
            ),
          );
          //debugPrint();
        },
      ),
    );
  }
  void debugPrint() {
    //print("\n\n" + widget.exerciseName);
    //print("\n\n" + widget.setsAndReps);
    //print("\n\n" + widget.exerciseNotes);
  }
}