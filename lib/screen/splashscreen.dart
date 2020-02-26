import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboarding.dart';
import 'signin.dart';

class SplashScreen extends StatefulWidget {
  static String id = "splashScreen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> userAlreadyRegistered() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final userAlreadyRegistered = false; //prefs.getBool("app_has_user");

    Future.delayed(Duration(seconds: 4), () {
      if (userAlreadyRegistered) {
        final userName = prefs.getString("user_name");
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Signin(username: userName)));
      }
      Navigator.pushReplacementNamed(context, FirstLoad.id);
    });
  }

  @override
  void initState() {
    super.initState();
    userAlreadyRegistered();
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
