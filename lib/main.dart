import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'screen/dashboard.dart';
import 'screen/splashScreen.dart';
import 'screen/register.dart';
import 'screen/signin.dart';
import 'screen/onboarding.dart';
// import 'services/api_services.dart';
import 'services/dummyData.dart';
// import 'screen/subscription.dart';

void setupLocator(){
  GetIt.I.registerLazySingleton(()=>DummyData());
  //TODO: uncomment the lazy singleton for api response
  // GetIt.I.registerLazySingleton(()=>ApiServices());
}

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home:null,
      initialRoute: SplashScreen.id,
      routes: <String, WidgetBuilder>{
        SplashScreen.id: (BuildContext context) => SplashScreen(),
        Dashboard.id: (BuildContext context) => Dashboard(),
        RegisterUser.id: (BuildContext context) => RegisterUser(),
        Signin.id: (BuildContext context) => Signin(),
        FirstLoad.id: (BuildContext context) => FirstLoad(),
        // Subscriptions.id: (BuildContext context) => Subscriptions(),
      },
    );
  }
}
