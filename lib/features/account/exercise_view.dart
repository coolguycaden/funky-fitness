import 'package:flutter/material.dart';

class ExerciseView extends StatefulWidget {
  const ExerciseView({
    super.key,

  });

  @override
  State<ExerciseView> createState() => _ExerciseViewState();
}

class _ExerciseViewState extends State<ExerciseView> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Positioned(
        left: 30,
        right: 30,
        top: 30,
        bottom: 30,
        child: Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}