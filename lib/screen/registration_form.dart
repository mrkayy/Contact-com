import 'package:flutter/material.dart';
import './registration_summary.dart';
import '../constant.dart';

class RegistrationForm extends StatefulWidget {
  static String id = "registrationForm";

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final formKey = GlobalKey<FormState>();

  final companyController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String _companyName;
  String _email;
  String _address;
  String _phoneNumber;
  String _password;
  String _confirmPassword;

  bool _hidePassword = true;
  bool _hideConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    final scrData = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
                            fontSize: 32.20),
                      ),
                      TextSpan(
                        text:
                            '\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Facili',
                        style: TextStyle(
                            fontFamily: "WorkSans",
                            color: Colors.black,
                            fontSize: 13.0),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 0.6 * scrData.height,
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <TextField>[
                      TextField(
                        controller: companyController,
                        onChanged: (val) {},
                        onEditingComplete: () {},
                        textCapitalization: TextCapitalization.sentences,
                        decoration:
                            kTextForm.copyWith(labelText: "Company Name"),
                      ),
                      TextField(
                        controller: addressController,
                        onChanged: (val) {},
                        onEditingComplete: () {},
                        decoration: kTextForm.copyWith(labelText: "Address"),
                      ),
                      TextField(
                        controller: emailController,
                        onChanged: (val) {},
                        onEditingComplete: () {},
                        keyboardType: TextInputType.emailAddress,
                        decoration: kTextForm.copyWith(labelText: "Email"),
                      ),
                      TextField(
                        controller: phoneNumController,
                        onChanged: (val) {},
                        onEditingComplete: () {},
                        keyboardType: TextInputType.phone,
                        decoration:
                            kTextForm.copyWith(labelText: "Phone Number"),
                      ),
                      TextField(
                        controller: passwordController,
                        onChanged: (val) {},
                        onEditingComplete: () {},
                        obscureText: _hidePassword,
                        decoration: kTextForm.copyWith(
                          labelText: "Password",
                          suffixIcon: _hidePassword
                              ? IconButton(
                                  icon: Icon(Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _hidePassword = !_hidePassword;
                                    });
                                  })
                              : IconButton(
                                  icon: Icon(Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      _hideConfirmPassword =
                                          !_hideConfirmPassword;
                                    });
                                  }),
                        ),
                      ),
                      TextField(
                        controller: confirmPasswordController,
                        onChanged: (val) {},
                        onEditingComplete: () {},
                        obscureText: _hideConfirmPassword,
                        decoration: kTextForm.copyWith(
                          labelText: "Confirm Password",
                          suffixIcon: _hideConfirmPassword
                              ? IconButton(
                                  icon: Icon(Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _hideConfirmPassword =
                                          !_hideConfirmPassword;
                                    });
                                  })
                              : IconButton(
                                  icon: Icon(Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      _hideConfirmPassword =
                                          !_hideConfirmPassword;
                                    });
                                  }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 0.12 * scrData.height,
                child: Column(
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 300.0,
                      height: 50.0,
                      color: Color(0xff2CD18A),
                      onPressed: () {
                        Navigator.of(context).pushNamed(RegistrationSummary.id);
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: "WorkSans",
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Already have an account? ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.0,
                                fontFamily: "WorkSans",
                              ),
                            ),
                            TextSpan(
                              text: "Signin",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12.0,
                                fontFamily: "WorkSans",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
