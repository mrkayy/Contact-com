import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'screen/dashboard.dart';
import 'screen/registration_success.dart';
import 'screen/registration_summary.dart';
import 'screen/splashScreen.dart';
import 'screen/register_subscription.dart';
import 'screen/signin.dart';
import 'screen/onboarding.dart';
import 'screen/registration_form.dart';
import 'services/api_services.dart';
// import 'services/dummyData.dart';

void setupServiceLocator() {
  // GetIt.I.registerLazySingleton(()=>DummyData());
  GetIt.I.registerLazySingleton(() => ApiServices());
}

void main() {
  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // home:null,
      initialRoute: SplashScreen.id,
      routes: <String, WidgetBuilder>{
        SplashScreen.id: (BuildContext context) => SplashScreen(),
        Dashboard.id: (BuildContext context) => Dashboard(),
        RegisterSubscription.id: (BuildContext context) =>
            RegisterSubscription(),
        Signin.id: (BuildContext context) => Signin(),
        FirstLoad.id: (BuildContext context) => FirstLoad(),
        RegistrationForm.id: (BuildContext context) => RegistrationForm(),
        RegistrationSummary.id: (BuildContext context) => RegistrationSummary(),
        RegistrationSuccessPage.id: (BuildContext context) =>
            RegistrationSuccessPage(),
      },
    );
  }
}
