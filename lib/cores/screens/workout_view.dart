import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView({super.key});

  @override
  Widget build(BuildContext context) {

    Color lightPurple = Color.fromARGB(255, 206, 139, 218);

    return new Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.angleLeft,
                        color: lightPurple,
                      ),
                      Text(
                        'Workouts',
                        style: TextStyle(
                          fontSize: 16,
                          color: lightPurple,
                        )
                      )
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),

            
          ],
        ),
      ),
    );
  }
}