import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sample_app/utitlities/stuff.dart';

import 'custom_loader.dart';

//this is used to hide loader as well as close dialogs
hideLoader(BuildContext context){
  Navigator.of(context, rootNavigator: true).pop();
}

// this method is used to close only the bottom sheet
closeBottomSheet(BuildContext context){
  Navigator.pop(context);
}

// Remove focus
// Used to close keyboard
removeFocus(BuildContext context) {
  FocusScope.of(context).requestFocus(new FocusNode());
}

showLoader(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Container(
          child: CustomLoader(),
        );
      });
}

Widget textStyleWithMediumSize(String text){
  return Container(
    alignment: Alignment.center,
    child: Text(text,
    style: styleAppText(Colors.black),),
  );
}



