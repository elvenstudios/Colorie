import 'package:flutter/material.dart';
import 'Screens/lading_page.dart';
import 'package:flutter/services.dart';


void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]) //Lock orientation in Portrait
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: LandingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

