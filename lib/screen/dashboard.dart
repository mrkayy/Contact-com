import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  static String id = "dashBoard";
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Welcome'),
        ),
      ),
    );
  }
}
