import 'package:flutter/material.dart';
// import 'register.dart';

class Signin extends StatefulWidget {
  static String id = "signin";
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    var scrData = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              child:
                  Stack(children: <Widget>[Positioned(child: Text("Login"))]),
            ),
          ),
        ],
      ),
    );
  }
}
