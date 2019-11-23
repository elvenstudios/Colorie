import 'package:flutter/material.dart';

import 'home.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool pushNotifValue = false;
  bool darkThemeValue = false;

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
                        style: Theme.of(context).textTheme.body1,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                    ),
                    Text(
                      'Edit Profile',
                      style: Theme.of(context).textTheme.body1,
                    ),
                    InkWell(
                      child: Text(
                        'Done',
                        style: Theme.of(context).textTheme.body1,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
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
                    style: Theme.of(context).textTheme.body1,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Push Notifications',
                    style: Theme.of(context).textTheme.body1,
                  ),
                  Switch(
                    value: pushNotifValue,
                    onChanged: (bool newValue) {
                      setState(() {
                        pushNotifValue = newValue;
                      });
                    },
                    activeColor: Colors.blueAccent,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Dark Theme',
                    style: Theme.of(context).textTheme.body1,
                  ),
                  Switch(
                    value: darkThemeValue,
                    onChanged: (bool newValue) {
                      setState(() {
                        darkThemeValue = newValue;
                      });
                    },
                    activeColor: Colors.blueAccent,
                  ),
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
                    style: Theme.of(context).textTheme.body1,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.blueAccent,
                    child: Text(
                      'Reset password',
                      style: Theme.of(context).textTheme.body1,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.blueAccent,
                    child: Text(
                      'Connect Fitbit™',
                      style: Theme.of(context).textTheme.body1,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.blueAccent,
                    child: Text(
                      'Remove Ads',
                      style: Theme.of(context).textTheme.body1,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.blueAccent,
                    child: Text(
                      'Log Out',
                      style: Theme.of(context).textTheme.body1,
                    ),
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
