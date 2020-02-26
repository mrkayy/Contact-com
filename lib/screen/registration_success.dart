import 'package:flutter/material.dart';

class RegistrationComplete extends StatelessWidget {
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
                    Text(
                      'Glad to have you onboard!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32.0,
                        fontFamily: "WorkSans",
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 97.0),
                    Image.asset("assets/images/complete-reg.png"),
                    SizedBox(height: 98.0),
                    MaterialButton(
                      height: 50.0,
                      minWidth: 303.0,
                      color: Color(0xff2CD18A),
                      onPressed: () {
                        // Navigator.of(context).pop();
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
