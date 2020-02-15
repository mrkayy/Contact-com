import 'package:flutter/material.dart';

import 'screen/dashboard.dart';
import 'screen/splashScreen.dart';
import 'screen/register.dart';
import 'screen/signin.dart';
import 'screen/firstLoad.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // home:null,
      initialRoute: SplashScreen.id,
      routes: <String, WidgetBuilder>{
        SplashScreen.id: (BuildContext context) => SplashScreen(),
        Dashboard.id: (BuildContext context) => Dashboard(),
        ResgisterUser.id: (BuildContext context) => ResgisterUser(),
        Signin.id: (BuildContext context) => Signin(),
        FirstLoad.id: (BuildContext context) => FirstLoad(),
      },
    );
  }
}