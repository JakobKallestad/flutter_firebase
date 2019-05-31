import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final user;
  Home(this.user);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text("home2"),
        title: Text("home ${widget.user.email}"),
      ),
    );
  }
}
