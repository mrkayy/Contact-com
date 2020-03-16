import 'package:flutter/material.dart';

const kLogofont = TextStyle(
  fontWeight: FontWeight.w300,
  fontSize: 20.0,
);

const kTextForm = InputDecoration(
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: Colors.redAccent),
  ),
// border: InputBorder(borderSide: ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: Color(0xff2CD18A)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xff3D3D3D)),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
  errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
      borderRadius: BorderRadius.all(Radius.circular(8.0))),
  labelStyle: TextStyle(color: Color(0xff3D3D3D)),
);

const kDefaultRichTextStyle = TextStyle(
  fontFamily: "WorkSans",
  color: Color(0xff3d3d3d),
);
