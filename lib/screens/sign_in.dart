import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Future<void> _signInAnonymously() async {
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
      appBar: AppBar(title: Text('Sign in')),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Enter an email'
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Enter a password'
              ),
            ),
            RaisedButton(
              child: Text('Sign In'),
              onPressed: _signInAnonymously,
            ),
          ],
        ),
      ),
    );
  }
}
