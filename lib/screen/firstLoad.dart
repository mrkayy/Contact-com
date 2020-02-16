import 'package:flutter/material.dart';
import 'signin.dart';
import 'register.dart';

class FirstLoad extends StatelessWidget {
  static String id = 'onload';

  @override
  Widget build(BuildContext context) {
    var scrData = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.08 * scrData.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 0.2 * scrData.height,
                    height: 0.16 * scrData.width,
                    padding: const EdgeInsets.all(20.0),
                    color: Color(0xff77cae0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(25.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(Signin.id);
                    },
                    child: Text('LOGIN', style: TextStyle(color: Colors.white)),
                  ),
                  MaterialButton(
                    minWidth: 0.2 * scrData.height,
                    height: 0.16 * scrData.width,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(25.0),
                      ),
                    ),
                    padding: const EdgeInsets.all(20.0),
                    color: Colors.blueGrey[200], //Color(0xff77cae0),
                    onPressed: () {
                      Navigator.of(context).pushNamed(RegisterUser.id);
                    },
                    child:
                        Text('REGISTER', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.10 * scrData.width,
              child: Center(
                // padding: const EdgeInsets.symmetric(horizontal:18.0),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'By logging in or resgistering, I agree to the',
                        style: TextStyle(color: Colors.black, fontSize: 11.0)),
                    TextSpan(
                        text: ' Terms of Service',
                        style:
                            TextStyle(color: Color(0xff77cae0), fontSize: 11.0))
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
