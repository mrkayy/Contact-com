import 'package:flutter/material.dart';
import '../constant.dart';
import 'firstLoad.dart';

class SplashScreen extends StatefulWidget {
  static String id = "splashScreen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void delayScreen() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => FirstLoad()));
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
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.35 * scrData.height,
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  radius: 50.0,
                ),
                SizedBox(height: 10.0),
                Text(
                  'Contact',
                  style: kLogofont,
                ),
              ],
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.01 * scrData.height,
            child: Column(
              children: <Widget>[
                Text('powered by: null',style: TextStyle(fontSize: 12.0),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
