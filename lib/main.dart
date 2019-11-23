import 'package:colorie/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ).then(
    (_) => runApp(MyApp()),
  );
}

class CustomColors {
  static const goodColor = Colors.greenAccent;
  static const almostGoodColor = Colors.yellowAccent;
  static const almostBadColor = Colors.orangeAccent;
  static const badColor = Colors.redAccent;
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Colorie',
      theme: ThemeData(
          textTheme: TextTheme(
        body1: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontFamily: "Raleway",
            fontWeight: FontWeight.bold),
      )),
      home: Scaffold(body: Home(title: 'title')),
      debugShowCheckedModeBanner: false,
    );
  }
}
