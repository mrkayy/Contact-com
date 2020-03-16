import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import '../constant.dart';
import '../model/user.dart';
import './dashboard.dart';

class Signin extends StatefulWidget {
  static String id = "signin";

  final SiginUser user;
  Signin({this.user});
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  void fetchLastUser() async {
    // SharedPreferences preferences = await SharedPreferences.getInstance();
  }

  // static var userName;
  // static var userPassword;
  bool _hidePassword = true;
  final userInfo = SiginUser();
  final formKey = GlobalKey<FormState>();
  final passWordController = TextEditingController();
  final userNameController = TextEditingController();

  @override
  void initState() {
    if (widget.user == null) {
      // userName = false;
    }
    // else {
    // userName = widget.user.user;
    // userPassword = widget.user.userPassword;
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var scrData = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 32.0, right: 32.0),
              child: Container(
                height: scrData.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/applogo.png",
                      height: 45.0,
                      width: 45.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 9.0, bottom: 5.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'LOGIN',
                              style: TextStyle(
                                  fontFamily: "WorkSans",
                                  color: Colors.black,
                                  fontSize: 32.20),
                            ),
                            TextSpan(
                              text:
                                  '\nWelcome back! {${widget.user.user}}, consectetur adipiscing elit. Facili {${widget.user.userPassword}}',
                              style: TextStyle(
                                  fontFamily: "WorkSans",
                                  color: Colors.black,
                                  fontSize: 13.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Builder(
                      builder: (BuildContext context) {
                        if (widget.user == null) {
                          return Container(
                              margin: const EdgeInsets.only(top: 25.0),
                              padding: const EdgeInsets.all(10.0),
                              height: 0.15 * scrData.height,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Center(
                                    child: Text('Oops! No user found...',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontFamily: "WorkSans",
                                            color: Colors.red)),
                                  ),
                                  FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    padding: const EdgeInsets.all(15.0),
                                    color: Color(0xff2CD18A),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Create Account',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ));
                        }
                        return Column(
                          children: <Widget>[
                            Form(
                              key: formKey,
                              // autovalidate: true,
                              child: Container(
                                height: 0.2 * scrData.height,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    TextFormField(
                                      initialValue: widget.user.user,
                                      controller: userNameController,
                                      onSaved: (val) {
                                        userInfo.user = val;
                                      },
                                      validator: (val) {
                                        return null;
                                      },
                                      decoration: kTextForm.copyWith(
                                        labelText: "User Name",
                                      ),
                                    ),
                                    TextFormField(
                                      onSaved: (val) {
                                        userInfo.userPassword = val;
                                      },
                                      validator: (val) {
                                        //TODO: Implement user authentication on sigin
                                        // if (val == passWordController.text) {
                                        //   print('okay');
                                        //   return null;
                                        // }
                                        // print('not-okay');
                                        // return "password does not match";
                                        return null;
                                      },
                                      obscureText: _hidePassword,
                                      decoration: kTextForm.copyWith(
                                        labelText: "Password",
                                        suffixIcon: _hidePassword
                                            ? IconButton(
                                                icon:
                                                    Icon(Icons.visibility_off),
                                                onPressed: () {
                                                  setState(
                                                    () {
                                                      _hidePassword =
                                                          !_hidePassword;
                                                    },
                                                  );
                                                },
                                              )
                                            : IconButton(
                                                icon: Icon(Icons.visibility),
                                                onPressed: () {
                                                  setState(
                                                    () {
                                                      _hidePassword =
                                                          !_hidePassword;
                                                    },
                                                  );
                                                },
                                              ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20.0),
                              height: 0.15 * scrData.height,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  MaterialButton(
                                    minWidth: 300.0,
                                    height: 50.0,
                                    color: Color(0xff2CD18A),
                                    onPressed: () {
                                      saveFormValue();
                                    },
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: "WorkSans",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      FlatButton(
                                        onPressed: () {},
                                        child: Text("Forgot Password"),
                                      ),
                                      FlatButton(
                                        onPressed: () {
                                          // Navigator.of(context).pop();
                                        },
                                        child: Text("Sign Up"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  saveFormValue() {
    final formStatus = formKey.currentState;
    if (formStatus.validate()) {
      formStatus.save();
      //TODO: validate user and redirect to department
      print(userInfo.user);
      print(userInfo.userPassword);
      Navigator.of(context).pushNamedAndRemoveUntil(
          Dashboard.id, (Route<dynamic> route) => false);
    }
  }
}
