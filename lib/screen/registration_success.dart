import 'package:flutter/material.dart';

import '../model/create_institution.dart';
import './signin.dart';

class RegistrationSuccessPage extends StatelessWidget {
  final NewInstitution institutionInfo;
  const RegistrationSuccessPage({this.institutionInfo});

  static String id = 'registrationSuccess';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 122.0,
                  left: 65.0,
                  right: 65.0,
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Glad to have you onboard!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32.0,
                          fontFamily: "WorkSans",
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 97.0,
                      child: Text(
                        institutionInfo.companyName,
                        style: TextStyle(
                          fontFamily: "WorkSans",
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Image.asset("assets/images/complete-reg.png"),
                    SizedBox(height: 98.0),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      height: 50.0,
                      minWidth: 303.0,
                      color: Color(0xff2CD18A),
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (BuildContext context) => Signin(
                                      user: institutionInfo.currentUser,
                                    )),
                            (Route<dynamic> route) => false);
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: "WorkSans",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
