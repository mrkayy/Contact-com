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
    Future.delayed(Duration(seconds: 3), () {
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
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              // top: 0.0,
              left: 0.0,
              right: 0.0,
              bottom: 0.35 * scrData.height,
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},//=> Navigator.of(context).pushNamed(FirstLoad.id),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      radius: 50.0,
                    ),
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
                  Text('powered by: null',style: TextStyle(fontSize: 11.0),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
