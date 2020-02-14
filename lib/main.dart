import 'package:flutter/material.dart';

import 'constant.dart';
import 'screen/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // home:null,
      initialRoute: SplashScreen.id,
      routes: <String, WidgetBuilder>{
        SplashScreen.id: (BuildContext context) => SplashScreen(),
        Dashboard.id: (BuildContext context) => Dashboard(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  static String id = "splashScreen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void delayScreen() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => Dashboard()));
    });
  }

  @override
  void initState() {
    super.initState();
    // delayScreen();
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
              bottom: 0.40 * scrData.height,
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: ()=> Navigator.of(context).pushNamed(Dashboard.id),
                    child: FlutterLogo(
                      size: 60.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Contact',
                    style: kIconFont,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
