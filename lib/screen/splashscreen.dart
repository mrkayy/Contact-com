import 'package:flutter/material.dart';
import 'onboarding.dart';

class SplashScreen extends StatefulWidget {
  static String id = "splashScreen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void delayScreen() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, FirstLoad.id);
    });
  }

  @override
  void initState() {
    super.initState();
    delayScreen();
  }

  @override
  Widget build(BuildContext context) {
    var scrData = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Image.asset("assets/images/applogo.png"),
            ),
          ),
        ],
      ),
    );
  }
}
