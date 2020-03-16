import 'package:flutter/material.dart';

import 'signin.dart';

class Dashboard extends StatefulWidget {
  static String id = "dashBoard";
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final screenData = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: screenData.height,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 35.0,
                child: Text('Welcome {widget.currentUser}'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(Signin.id);
                },
                child: Text('logout'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
