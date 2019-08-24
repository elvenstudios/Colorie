import 'package:flutter/material.dart';
import 'package:colorie/screens/home.dart';

class LandingPage extends StatelessWidget {
  final String title;

  LandingPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Home(title: title);
  }
}
