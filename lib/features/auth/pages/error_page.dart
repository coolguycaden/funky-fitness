import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const ErrorPage({
    required Key key,
    required this.errorDetails,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.red,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Text(
          "Error occured, sorry for inconvenience!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}