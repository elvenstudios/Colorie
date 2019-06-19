import 'package:flutter/material.dart';

class AddToLogScreen extends StatefulWidget {
  @override
  _AddToLogScreenState createState() => _AddToLogScreenState();
}

class _AddToLogScreenState extends State<AddToLogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}


//TODO: move logic from bottom modal to here