

import 'dart:ui';

import 'package:flutter/material.dart';

var redtextcolor =  Color.fromRGBO(178, 68, 52, 1.0);

var appThemeColor= Color.fromRGBO(239, 190, 46, 1.0);

var dividercolor=Color.fromRGBO(225, 225, 225, 1.0);

var transparentcolor = Color.fromRGBO(86, 86, 86, 1.0);

var skybluebordercolor = Color.fromRGBO(171, 185, 225, 1.0);

var lightgreycolor=Colors.grey[400];

var darkgreycolor=Colors.grey[500];

//app bar text widget
Widget appBarText(text){
 return Align(
    alignment: Alignment.center,
    child: Text(
      text,
      style: TextStyle(
          color: redtextcolor,
          fontSize: 25,
          fontWeight: FontWeight.bold),
    ),
  );
}

//heading text widget
Widget headingText(text){
  return Container(
    margin: EdgeInsets.only(left: 15),
    child: Text(
      text,
      style: TextStyle(fontSize: 18, color: Colors.black,fontWeight: FontWeight.bold),
    ),
  );
}

// app name text style
TextStyle styleAppText(color,{fontWeight: FontWeight.bold,}) {
  return TextStyle(
    color: color,
    fontSize: 18,
    letterSpacing: 1,
    fontFamily: 'Gothic',
  );
}

// button style
TextStyle styleButton(color) {
  return TextStyle(
    color: color,
    fontSize: 15,
    letterSpacing: 1,
    fontFamily: 'Gothic',
  );
}