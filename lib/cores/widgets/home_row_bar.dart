//import necessary packages
import "package:flutter/material.dart";

Container homeRowBar() {
    return Container(
      decoration: const BoxDecoration(
        border: BorderDirectional(
          top: BorderSide(width: 1, color: Colors.black),
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