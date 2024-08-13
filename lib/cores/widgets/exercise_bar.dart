//import necessary packages
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//import necessary decorations
import 'package:funkyfitness/cores/decorations/bottom_box_border.dart';

class ExerciseBar extends StatefulWidget {
  final String exerciseName;
  final String setsAndReps;
  final String exerciseNotes;

  ExerciseBar({
    Key? key,
    required this.exerciseName,
    required this.setsAndReps,
    required this.exerciseNotes,
  }): super (key: key);

  @override
  State<ExerciseBar> createState() => _ExerciseBarState();
}

class _ExerciseBarState extends State<ExerciseBar> {

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      top: false,

      child: GestureDetector(
        child: new Container(
          margin: new EdgeInsets.only(left: 7,),
          decoration: bottomBoxBorder(),
          child: new Column(
            children: [
              Row(
                children: [
                  new Padding(
                    padding: new EdgeInsets.only(bottom: 20, top: 16, right: 30),
                    child: new Text(
                      widget.exerciseName,
                      style: TextStyle(
                        fontSize: 18
                      ), 
                    ),
                  ),
                  
                  new Spacer(),

                  new Icon(FontAwesomeIcons.ellipsis, size: 20),
                ],
              ),

              Row(
                children: [

                ],
              )
            ],
          ),
        ),

        onTap: () {
          debugPrint();
        },
      ),
    );
  }
  void debugPrint() {
    print("\n\n" + widget.exerciseName);
    print("\n\n" + widget.setsAndReps);
    print("\n\n" + widget.exerciseNotes);
  }
}