import 'package:flutter/material.dart';
import '../model/create_institution.dart';
import '../model/select_subscription.dart';
import '../model/user.dart';
import './registration_summary.dart';
import '../constant.dart';

class RegistrationForm extends StatefulWidget {
  final SelectedSubscription subStatus;
  static String id = "registrationForm";

  const RegistrationForm({this.subStatus});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final formKey = GlobalKey<FormState>();

  bool _hidePassword = true;

  final passWordController = TextEditingController();
  final registrationDetails = NewInstitution();
  final userInfo = SiginUser();

  @override
  Widget build(BuildContext context) {
    final scrData = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: scrData.height,
              padding:
                  const EdgeInsets.only(top: 20.0, left: 32.0, right: 32.0),
              child: Column(
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
                            text: 'Register Institution',
                            style: TextStyle(
                                fontFamily: "WorkSans",
                                color: Colors.black,
                                fontSize: 32.20),
                          ),
                          TextSpan(
                            text:
                                '\nYour selected subscription plan is ${widget.subStatus.plan}',
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
                    height: 0.63 * scrData.height,
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <TextFormField>[
                          TextFormField(
                            onSaved: (name) =>
                                registrationDetails.companyName = name,
                            validator: (val) =>
                                val.isEmpty ? "please enter you address" : null,
                            textCapitalization: TextCapitalization.sentences,
                            decoration:
                                kTextForm.copyWith(labelText: "Company Name"),
                          ),
                          TextFormField(
                            onSaved: (add) => registrationDetails.address = add,
                            validator: (val) =>
                                val.isEmpty ? "please enter you address" : null,
                            decoration:
                                kTextForm.copyWith(labelText: "Address"),
                          ),
                          //TODO: check if email already exists
                          TextFormField(
                            onSaved: (email) =>
                                registrationDetails.email = email,
                            validator: (val) => !val.contains("@")
                                ? "please enter a valid email"
                                : null,
                            keyboardType: TextInputType.emailAddress,
                            decoration: kTextForm.copyWith(labelText: "Email"),
                          ),
                          TextFormField(
                            onSaved: (phone) =>
                                registrationDetails.phoneNumber = phone,
                            validator: (input) =>
                                input.length > 11 || input.length < 11
                                    ? "Please enter a valid phone Number"
                                    : null,
                            keyboardType: TextInputType.phone,
                            decoration:
                                kTextForm.copyWith(labelText: "Phone Number"),
                          ),
                          TextFormField(
                            controller: passWordController,
                            onSaved: (val) =>
                                registrationDetails.password = val,
                            validator: (val) => val.length <= 6
                                ? "password is too short"
                                : null,
                            obscureText: _hidePassword,
                            decoration: kTextForm.copyWith(
                              labelText: "Password",
                              suffixIcon: _hidePassword
                                  ? IconButton(
                                      icon: Icon(Icons.visibility_off),
                                      onPressed: () {
                                        setState(
                                          () {
                                            _hidePassword = !_hidePassword;
                                          },
                                        );
                                      },
                                    )
                                  : IconButton(
                                      icon: Icon(Icons.visibility),
                                      onPressed: () {
                                        setState(
                                          () {
                                            _hidePassword = !_hidePassword;
                                          },
                                        );
                                      },
                                    ),
                            ),
                          ),
                          TextFormField(
                            onSaved: (val) {
                              registrationDetails.confirmPassword = val;
                            },
                            validator: (val) {
                              if (val == passWordController.text) {
                                print('okay');
                                return null;
                              }
                              print('not-okay');
                              return "password does not match";
                            },
                            obscureText: _hidePassword,
                            decoration: kTextForm.copyWith(
                              labelText: "Confirm Password",
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
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          minWidth: 300.0,
                          height: 50.0,
                          color: Color(0xff2CD18A),
                          onPressed: () {
                            saveregistrationDetails();
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  saveregistrationDetails() {
    var formState = formKey.currentState;
    if (formState.validate()) {
      formState.save();
      registrationDetails.subscription = widget.subStatus;
      userInfo.user = registrationDetails.email;
      userInfo.userPassword = registrationDetails.password;
      registrationDetails.currentUser = userInfo;
      print(registrationDetails.companyName);
      print(registrationDetails.subscription);
      print(registrationDetails.email);
      print(registrationDetails.address);
      print(registrationDetails.phoneNumber);
      print(registrationDetails.phoneNumber);

      //Navigate to registration summary screen
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) =>
              RegistrationSummary(registrationSummary: registrationDetails)));
    }
  }
}
