//Check for internet Connection
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/services/Locator.dart';
import 'package:sample_app/services/NavigationService.dart';

Future<bool> isConnectedToInternet() async {
  try {
    final result = await InternetAddress.lookup('google.com')
        .timeout(const Duration(seconds: 5));
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } catch (_) {
    return false;
  }
}
void navigateWithNoBackStackScreen(routeName){
  NavigationService _navigationService = locator<NavigationService>();
  _navigationService.navigateWithRemovingAllPrevious(routeName);
}

void navigateWithBackStackScreen(routeName){
  NavigationService _navigationService = locator<NavigationService>();
  _navigationService.navigateWithBack(routeName);
}
showAlert(BuildContext context, String msg, Function onclick) {
  // Create button
  Widget okButton = MaterialButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
      onclick();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(msg),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async {
          print("WillPopScope");
          return false;
        },
        child: alert,
      );
      return alert;
    },
  );
}

bool validateEmail(String email) {
  if (email.isEmpty) {
// The form is empty
    return false;
  }
// This is just a regular expression for email addresses
  String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
      "\\@" +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
      "(" +
      "\\." +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
      ")+";
  RegExp regExp = new RegExp(p);

  if (regExp.hasMatch(email)) {
// So, the email is valid
    return true;
  } else {
    return false;
  }
}

bool validatePassword(String pass) {
  if (pass.isNotEmpty && pass.length >= 6) {
    return true;
  } else {
    return false;
  }
}

bool validatePhoneNo(String no) {
  if (no.isEmpty) {
    return true;
  }
  try {
    int.parse(no);
  } catch (e) {
    return true;
  }

  if (no.length > 8 && no.length < 15) {
    return false;
  } else {
    return true;
  }
}