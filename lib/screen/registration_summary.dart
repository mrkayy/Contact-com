import 'package:flutter/material.dart';

import './registration_success.dart';

class RegistrationSummary extends StatelessWidget {
  final String companyName;
  final String address;
  final String email;
  final String phone;

  static String id = 'registrationSummmry';

  const RegistrationSummary(
      {this.companyName, this.address, this.email, this.phone});
  @override
  Widget build(BuildContext context) {
    final scrData = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 81.0, left: 36.0, right: 36.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              "assets/images/applogo.png",
              height: 45.0,
              width: 45.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 9.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'Register',
                        style: TextStyle(
                            fontFamily: "WorkSans",
                            color: Colors.black,
                            fontSize: 32.20)),
                    TextSpan(
                        text:
                            '\nKindly confirm that the details below are correct before creating you Institution account.',
                        style: TextStyle(
                            fontFamily: "WorkSans",
                            color: Colors.black,
                            fontSize: 13.0)),
                  ],
                ),
              ),
            ),
            Container(
              height: 0.5 * scrData.height,
              padding: const EdgeInsets.only(top: 30.0),
              // alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Registration Summary',style: TextStyle(fontSize: 13.0),),
                  SizedBox(height: 20.0),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Company Name",
                          style: TextStyle(fontSize: 11.0, color: Colors.black),
                        ),
                        TextSpan(
                          text: "\n{Company Name}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50.0),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Address",
                          style: TextStyle(fontSize: 11.0, color: Colors.black),
                        ),
                        TextSpan(
                          text: "\n{Company Name}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50.0),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Email",
                          style: TextStyle(fontSize: 11.0, color: Colors.black),
                        ),
                        TextSpan(
                          text: "\n{Company Name}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50.0),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Phone Number",
                          style: TextStyle(fontSize: 11.0, color: Colors.black),
                        ),
                        TextSpan(
                          text: "\n{Company Name}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 28.0),
              height: 0.18 * scrData.height,
              child: Column(
                children: <Widget>[
                  MaterialButton(
                    minWidth: 300.0,
                    height: 50.0,
                    color: Color(0xff2CD18A),
                    onPressed: () {
                      Navigator.of(context).pushNamed(RegistrationComplete.id);
                    },
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: "WorkSans",
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height:7.0),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Back",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontFamily: "WorkSans",
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
