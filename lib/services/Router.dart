import 'package:flutter/material.dart';
import 'package:sample_app/screens/HomeScreen.dart';
import 'package:sample_app/screens/LoginScreen.dart';
import 'package:sample_app/screens/SignUpScreen.dart';
import 'package:sample_app/screens/SplashScreen.dart';
import 'package:sample_app/utitlities/routes_constants.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  var data = settings.arguments;
  switch (settings.name) {
    case Login_Screen :
       return MaterialPageRoute(builder: (context) => LoginScreen());
        break;
    case Home_Screen :
      return MaterialPageRoute(builder: (context) => HomeScreen());
      break;
    case Sign_Up :
      return MaterialPageRoute(builder: (context) => SignUpScreen());
      break;
    default:
       return MaterialPageRoute(builder: (context) => SplashScreen());
       break;

  }
}
