import 'package:colorie/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Future<void> _signIn() async {
    if (emailController.text.isEmpty) {
      Alert(context: context, title: "Error", desc: "Blank Email").show();
    }else if(passwordController.text.isEmpty){
      Alert(context: context, title: "Error", desc: "Blank Password").show();
    }else {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } catch (e) {
        Alert(context: context, title: "Error", desc: e.toString()).show();
      }
    }
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  _navigateToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.cloud_upload,
                      size: 100,
                      color: Colors.grey,
                    ),
                    Text(
                      'Colorie',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 50.0,
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 60.0, bottom: 40.0),
                width: 300.0,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(FeatherIcons.user),
                        Container(
                          padding: EdgeInsets.only(left: 8.0),
                          width: 275.0,
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Email',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(FeatherIcons.lock),
                        Container(
                          padding: EdgeInsets.only(left: 8.0),
                          width: 275.0,
                          child: TextField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Password',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RawMaterialButton(
                  fillColor: Colors.green,
                  splashColor: Colors.greenAccent,
                  onPressed: _signIn,
                  child: Container(
                    width: 300.0,
                    height: 50.0,
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      // Box decoration takes a gradient
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.grey,
                          offset: new Offset(5.0, 5.0),
                          spreadRadius: .5,
                          blurRadius: 20.0,
                        )
                      ],
                      gradient: LinearGradient(
                        // Where the linear gradient begins and ends
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        // Add one stop for each color. Stops should increase from 0 to 1
                        stops: [0.1, 1],
                        colors: [
                          // Colors are easy thanks to Flutter's Colors class.
                          Colors.greenAccent[200],
                          Colors.lightBlueAccent[100],
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: InkWell(
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.grey, fontSize: 16.0),
              ),
              onTap: _navigateToSignUp,
            ),
          ),
        ],
      ),
    );
  }
}
