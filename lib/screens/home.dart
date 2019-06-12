import 'package:colorie/widgets/color_card.dart';
import 'package:flutter/material.dart';
import '../widgets/circle_percentage.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(child: Text('Test')),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CirclePercentage(),
            ColorCard(
              title: 'Lots',
              borderColor: Colors.greenAccent,
              subtext: '< 300 cal per lb',
              percentageTitle: '30%',
            ),
            ColorCard(
              title: 'Plenty',
              borderColor: Colors.amberAccent,
              subtext: '< 600 cal per lb',
                percentageTitle: '50%',
            ),
            ColorCard(
              title: 'Some',
              borderColor: Colors.orangeAccent,
              subtext: '< 1500 cal per lb',
                percentageTitle: '20%',
            ),
            ColorCard(
              title: 'Few',
              borderColor: Colors.pinkAccent,
              subtext: '< 4000 cal per lb',
              percentageTitle: '20%',
            ),
          ],
        ),
      ),
    );
  }
}
