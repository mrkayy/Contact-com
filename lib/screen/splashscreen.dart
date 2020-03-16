import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity/connectivity.dart';
import '../enums/connectivity_enum.dart';
import '../model/user.dart';
import './onboarding.dart';
import './signin.dart';

class SplashScreen extends StatefulWidget {
  static String id = "splashScreen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //TODO: Check device connectivity
  var connectionStatus;
  //checking device connectivity
  void connectionAvailable() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // String _getConnectivityStatus(ConnectivityResult result) {
      ConnectivityStatus _getConnectivityStatus(ConnectivityResult result) {
        switch (result) {
          case ConnectivityResult.mobile:
            // return connectionStatus = 'mobile';
            return ConnectivityStatus.Mobile;
            break;
          case ConnectivityResult.wifi:
            // return connectionStatus = 'wifi';
            return ConnectivityStatus.Wifi;
            break;
          case ConnectivityResult.none:
            // return connectionStatus = 'offline';
            return ConnectivityStatus.Offline;
            break;
          default:
            // return connectionStatus = 'offline';
            return ConnectivityStatus.Offline;
        }
      }

      //convert result to enum
      // var connectionState = _getConnectivityStatus(result);

      //broadcast this over the stream
      // connectionStatusController.add(connectionStatus);
      // return connectionState;
      return connectionStatus = _getConnectivityStatus(result);
    });
  }

  final lastUser = SiginUser();

  //check app memory for existing user
  Future<void> userAlreadyRegistered() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // TODO: create sharedPreferences key: lastUser
    bool userAlreadyRegistered = prefs.getBool('lastUser');

    switch (userAlreadyRegistered.toString()) {
      case 'null':
        userAlreadyRegistered = false;
        break;
      case 'true':
        userAlreadyRegistered = true;
        break;
      default:
        userAlreadyRegistered = false;
    }

    if (userAlreadyRegistered) {
      Future.delayed(Duration(seconds: 4), () {
        // TODO: create sharedPreferences key: lastUserName
        lastUser.user = prefs.getString("lastUserName");
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Signin(user: lastUser)));
      });
    } else {
      Future.delayed(Duration(seconds: 4), () {
        Navigator.pushReplacementNamed(context, FirstLoad.id);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    userAlreadyRegistered();
    // connectionAvailable();
    // print(connectionStatus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset("assets/images/applogo.png"),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(20.0),
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Powered by: CreditPay',
                  style: TextStyle(fontFamily: "WorkSans"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
