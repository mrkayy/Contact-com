import 'package:flutter/material.dart';
import '../model/create_institution.dart';

Widget confirmRegistration(
        {NewInstitution institution,
        Function setState,
        bool registrationState}) =>
    Builder(builder: (_) {
      if (registrationState) {
        return Center(child: CircularProgressIndicator());
      }
      return SimpleDialog(
        elevation: 4.0,
        title: Text('Register!'),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        children: <Widget>[
          FlatButton(onPressed: setState, child: Text('continue'))
        ],
      );
    },);

// class ConfrimRegistration extends StatefulWidget {

//   final NewInstitution institution;
//   ConfrimRegistration({this.institution});

//   @override
//   _ConfrimRegistrationState createState() => _ConfrimRegistrationState();
// }

// class _ConfrimRegistrationState extends State<ConfrimRegistration> {
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
