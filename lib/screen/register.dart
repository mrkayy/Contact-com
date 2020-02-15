import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'signin.dart';

class ResgisterUser extends StatefulWidget {
  static String id = "register";
  @override
  _ResgisterUserState createState() => _ResgisterUserState();
}

class _ResgisterUserState extends State<ResgisterUser> {
  var url = '';
  var apiPath = '/account';

  @override
  Widget build(BuildContext context) {
    var scrData = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0.0,
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              left: 0.083 * scrData.width,
              // right: 0.0,
              bottom: 0.04 * scrData.height,
              child: Column(
                children: <Widget>[
                  MaterialButton(
                    minWidth: 0.40 * scrData.height,
                    height: 0.11 * scrData.width,
                    padding: const EdgeInsets.all(20.0),
                    color: Color(0xff77cae0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    onPressed: () {},
                    child:
                        Text('REGISTER', style: TextStyle(color: Colors.white)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed(Signin.id);
                      },
                      child:  RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'I already have an account ',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 11.0)),
                          TextSpan(
                              text: 'LOGIN',
                              style: TextStyle(
                                  color: Color(0xff77cae0), fontSize: 11.0))
                        ]),
                      ),
                    ),
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
