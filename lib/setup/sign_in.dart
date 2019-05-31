import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'pages/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  final GlobalKey<FormState> _form_key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign in"),
      ),
      body: Form(
        key: _form_key,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (input) {
                if (input.isEmpty) {
                  return "Please type an email";
                }
              },
              onSaved: (input) => _email = input,
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),
            TextFormField(
              validator: (input) {
                if (input.length < 6) {
                  return "Your password needs to be  at least 6 characters";
                }
              },
              onSaved: (input) => _password = input,
              decoration: InputDecoration(
                labelText: "Password",
              ),
              obscureText: true,
            ),
            RaisedButton(
              onPressed: signIn,
              child: Text("Sign in"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final formState = _form_key.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home(user)),
        );
      } catch (e) {
        print(e.message);
      }
    }
  }
}
