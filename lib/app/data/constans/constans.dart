import 'package:flutter/material.dart';

const kPrimaryColor = Color(0XFFFFFFFF);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF000000);
const kTextColor = Colors.white;
const errorInputColor =  Color(0xFFB31312);
const buttonFillColor = 0XFF9C8EF4;
const focusInputColor = Color(0XFF000000);
const enableInputColor = kPrimaryColor;

const kAnimationDuration = Duration(milliseconds: 200);

const headingStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);