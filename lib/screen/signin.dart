import 'package:flutter/material.dart';
import 'register.dart';

class Signin extends StatefulWidget {
  static String id = "signin";
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    var scrData = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.black,
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
                        Text('LOGIN', style: TextStyle(color: Colors.white)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.of(context).pop();
                        Navigator.of(context).pushReplacementNamed(ResgisterUser.id);
                      },
                      child:RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Don\'t have an account? ',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 11.0)),
                          TextSpan(
                              text: 'REGISTER',
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
