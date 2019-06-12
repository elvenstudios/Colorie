import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
//  int _counter = 0;
//
//  void _incrementCounter() {
//    setState(() {
//      _counter++;
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(child: Text('Test')),
      ),
      body: SafeArea(
        child: Container(
          child: Text('Home'),
        ),
      ),
      bottomNavigationBar: new BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Theme.of(context).primaryColor,

        child:  new Builder(builder: (context) {
          return new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(icon: Icon(Icons.menu), onPressed: () {
                Scaffold.of(context).openDrawer();
              },),
              IconButton(icon: Icon(Icons.settings), onPressed: () {},),
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("HI");
        },
        child: new Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
