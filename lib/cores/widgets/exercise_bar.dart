//import necessary packages
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//import necessary decorations
import 'package:funkyfitness/cores/decorations/bottom_box_border.dart';


class ExerciseBar extends StatefulWidget {
  const ExerciseBar({super.key});

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
                      'An exercise',
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
                  
                  //data from the exercise
                ],
              )
            ],
          ),
        ),

        onTap: () {
          
        },
      ),
    );
  }
  
}