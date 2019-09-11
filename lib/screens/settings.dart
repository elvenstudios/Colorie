
import 'package:flutter/material.dart';

import 'home.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool pushNotifValue = false;
  bool darkThemeValue = false;

  
  void _onChangedPushNotif(bool value) => setState(() => pushNotifValue = value);
  void _onChangeddarkTheme(bool value) => setState(() => darkThemeValue = value);

  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            width: 392,
            height: 300,
            color: Colors.blueAccent,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Home()),
                        );
                      },
                    ),
                    Text(
                      'Edit Profile',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      child: Text(
                        'Done',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Home()),
                        );
                      },
                    ),
                  ],
                ),
                new Container(
                    width: 150.0,
                    height: 150.0,
                    margin: EdgeInsets.only(
                      top: 50.0,
                    ),
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "https://randomuser.me/api/portraits/lego/6.jpg")))),
              ],
            ),
          ),
        ],
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 10.0, bottom: 40.0),
          width: 350,
          height: 500,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Options',
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 12.0,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Push Notifications',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 25.0,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.bold),
                  ),
                  Switch(value: pushNotifValue, onChanged: _onChangedPushNotif,activeColor: Colors.blueAccent,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Dark Theme',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 25.0,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.bold),
                  ),
                  Switch(value: darkThemeValue, onChanged: _onChangeddarkTheme,activeColor: Colors.blueAccent,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Account',
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 12.0,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.blueAccent,
                    child: const Text('Reset password',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.blueAccent,
                    child: const Text('Connect Fitbit™',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.blueAccent,
                    child: const Text('Remove Ads',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  RaisedButton(
                    onPressed:() {
                      Navigator.pop(context);
                    },
                    color: Colors.blueAccent,
                    child: const Text('Log Out',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ])
    ]));
  }
}
