import 'package:flutter/material.dart';

const kCategoryTextStyle = TextStyle(
  color: Color(0xff626262),
  fontWeight: FontWeight.w600,
);

const kPrimaryBlue = Color(0xff040f48);

const kSmallDescColor = Color(0xff50436e);

const kSmallDescStyle = TextStyle(fontSize: 12, color: kSmallDescColor);

const kMediumDescStyle = TextStyle(fontSize: 14, color: kSmallDescColor);

const kLargeDescStyle = TextStyle(fontSize: 17, color: kSmallDescColor,  	fontWeight: FontWeight.bold);
const borderColor = Color.fromRGBO(229, 231, 235, 1);

const kPrimaryRed = Colors.red;

final kShape =
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0));

final customerrorBorder =  OutlineInputBorder(
  borderRadius: BorderRadius.circular(10.0),
  borderSide: BorderSide(
    color: Colors.red,
    width: 1.0,
  ),
);

final RegExp emailRegex = new RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

final errorField = "Required field";