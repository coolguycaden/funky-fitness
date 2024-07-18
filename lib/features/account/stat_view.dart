//import necessary packages

import 'package:flutter/material.dart';

class StatView extends StatelessWidget {
  const StatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          backgroundColor: Colors.green,
          title: const Text('Welcome to Stats!'),
      ),

    );
  }
}
