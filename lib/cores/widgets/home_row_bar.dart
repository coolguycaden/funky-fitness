//import necessary packages
import "package:flutter/material.dart";

Container homeRowBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 43, 43, 43),
        border: BorderDirectional(
          top: BorderSide(width: 1, color: Color.fromARGB(255, 95, 95, 95)),
        ),
      ),

      child: const TabBar(
        tabs: [
          Tab(
            text: 'Workouts',
            icon: Icon(Icons.fitness_center),
          ),
          
          Tab(
            text: 'Statistics',
            icon: Icon(Icons.bar_chart),
          ),
          
          Tab(
            text: 'Profile',
            icon: Icon(Icons.face),
            
          ),
        ],
      ),
    );
  }