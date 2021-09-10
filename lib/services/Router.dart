import 'package:flutter/material.dart';
import 'package:sample_app/screens/DashboardScreen.dart';
import 'package:sample_app/screens/HomeScreen.dart';
import 'package:sample_app/screens/LoginScreen.dart';
import 'package:sample_app/screens/SignUpScreen.dart';
import 'package:sample_app/screens/SplashScreen.dart';
import 'package:sample_app/screens/TabBarScreen.dart';
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
    case Dashboard_Screen :
      return MaterialPageRoute(builder: (context) => DashboardScreen());
      break;
    case Tab_Bar :
      return MaterialPageRoute(builder: (context) => TabBarScreen());
      break;
    default:
       return MaterialPageRoute(builder: (context) => SplashScreen());
       break;

  }
}
