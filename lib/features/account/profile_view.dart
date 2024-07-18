//import necessary packages

import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          backgroundColor: Colors.blue,
          title: const Text('Welcome to Profile!'),
        ),

    );
  }
}