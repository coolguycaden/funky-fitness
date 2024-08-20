import 'package:flutter/material.dart';

//This is a decoration to add a bottom border to the individual workouts, giving a rectanble appearnce
BoxDecoration bottomBoxBorder() {
  return const BoxDecoration(
    border: BorderDirectional(
      bottom: BorderSide(width: 1, color: Colors.grey),
    ),
  );           
}