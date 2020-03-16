import 'package:flutter/material.dart';

import '../model/user.dart';
// import './registration_success.dart';
import '../model/create_institution.dart';
import '../widgets/confirm_registration_dialog.dart';

class RegistrationSummary extends StatefulWidget {
  static String id = 'registrationSummmry';
  final NewInstitution registrationSummary;

  RegistrationSummary({this.registrationSummary});

  @override
  _RegistrationSummaryState createState() => _RegistrationSummaryState();
}

class _RegistrationSummaryState extends State<RegistrationSummary> {
  final userInfo = SiginUser();

  bool isRegistering = false;
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
                        text: 'Confirm Registration',
                        style: TextStyle(
                            fontFamily: "WorkSans",
                            color: Colors.black,
                            fontSize: 32.20)),
                    TextSpan(
                        text:
                            '\nKindly confirm that the details below are correct before creating your Institution account.',
                        style: TextStyle(
                            fontFamily: "WorkSans",
                            color: Colors.black,
                            fontSize: 13.0)),
                  ],
                ),
              ),
            ),
            Container(
              height: 0.48 * scrData.height,
              // padding: const EdgeInsets.only(top: 30.0),
              // alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Subscription Plan",
                          style: TextStyle(fontSize: 11.0, color: Colors.black),
                        ),
                        TextSpan(
                          text:
                              "\n${widget.registrationSummary.subscription.plan}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Subscription Plan Amount",
                          style: TextStyle(fontSize: 11.0, color: Colors.black),
                        ),
                        TextSpan(
                          text:
                              "\n${widget.registrationSummary.subscription.price}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Subscription Package",
                          style: TextStyle(fontSize: 11.0, color: Colors.black),
                        ),
                        TextSpan(
                          text:
                              "\n${widget.registrationSummary.subscription.description}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Company Name",
                          style: TextStyle(fontSize: 11.0, color: Colors.black),
                        ),
                        TextSpan(
                          text: "\n${widget.registrationSummary.companyName}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 50.0),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Address",
                          style: TextStyle(fontSize: 11.0, color: Colors.black),
                        ),
                        TextSpan(
                          text: "\n${widget.registrationSummary.address}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 50.0),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Email",
                          style: TextStyle(fontSize: 11.0, color: Colors.black),
                        ),
                        TextSpan(
                          text: "\n${widget.registrationSummary.email}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 50.0),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Phone Number",
                          style: TextStyle(fontSize: 11.0, color: Colors.black),
                        ),
                        TextSpan(
                          text: "\n${widget.registrationSummary.phoneNumber}",
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
              child: Column(
                children: <Widget>[
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    minWidth: 300.0,
                    height: 50.0,
                    color: Color(0xff2CD18A),
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: "WorkSans",
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return confirmRegistration(
                                registrationState: false,
                                setState: registeringInstitution,
                                institution: widget.registrationSummary);
                          });
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) =>
                      //     RegistrationSuccessPage(
                      //       institutionInfo: registrationSummary,
                      //     ),
                      //   ),
                      // );
                    },
                  ),
                  SizedBox(height: 7.0),
                  FlatButton(
                    child: Text(
                      "Back",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontFamily: "WorkSans",
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void registeringInstitution() {
    setState(() {
      isRegistering = !isRegistering;
    });
    print(isRegistering);
  }
}
