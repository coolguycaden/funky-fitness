//import necessary packages
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//import necessary decorations
import 'package:funkyfitness/cores/decorations/bottom_box_border.dart';
import 'package:funkyfitness/cores/screens/workout_view.dart';

class WorkoutBar extends StatefulWidget {
  final String currentWorkout;
  final String currentExercises;

  WorkoutBar({
    Key? key,
    required this.currentWorkout,
    required this.currentExercises,
  }): super(key: key);
  

  @override
  _WorkoutBarState createState() => new _WorkoutBarState();
}

class _WorkoutBarState extends State<WorkoutBar> {

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      top: false,

      child: GestureDetector(
        child: new Container(
          margin: new EdgeInsets.only(left: 7,),
          decoration: bottomBoxBorder(),
          child: new Row(
            children: [
              new Padding(
                padding: new EdgeInsets.only(bottom: 20, top: 16, right: 30),
                child: new Text(
                  widget.currentWorkout,
                  style: TextStyle(
                    fontSize: 18
                  ), 
                ),
              ),

              new Spacer(),

              new Icon(FontAwesomeIcons.angleRight, size: 20),
            ],
          ),
        ),

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WorkoutView(),
            ),
          );
        },
      ),
    );
  }
  
}