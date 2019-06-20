import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Future<void> _signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } catch (e) {
      print(e); // TODO: show dialog with error
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign in',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Center(
          child: Column(
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Enter an email'),
                    ),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter a password'),
                    ),
                  ],
                ),
              ),
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
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  decoration: BoxDecoration(
                    // Box decoration takes a gradient
                    boxShadow: [
                      new BoxShadow(
                          color: Colors.grey,
                          offset: new Offset(5.0, 5.0),
                          spreadRadius: .5,
                          blurRadius: 20.0)
                    ],
                    gradient: LinearGradient(
                      // Where the linear gradient begins and ends
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      // Add one stop for each color. Stops should increase from 0 to 1
                      stops: [0.5, 1],
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
      ),
    );
  }
}
