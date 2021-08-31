import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sample_app/services/Locator.dart';
import 'package:sample_app/services/NavigationService.dart';
import 'package:sample_app/utitlities/ImageConstants.dart';
import 'package:sample_app/utitlities/class_media_query.dart';
import 'package:sample_app/utitlities/routes_constants.dart';
class SplashScreen extends StatefulWidget {
   SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  NavigationService _navigationService = locator<NavigationService>();

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),
            ()=>
            _navigationService.navigateWithRemovingAllPrevious(Login_Screen)
    );
  }
  @override
  Widget build(BuildContext context) {
    ClassMediaQuery(context);
    return Scaffold(
      body: Container(
        child: Image.asset(
          ImageConstants.loginLogo,
          height: ClassMediaQuery.screenHeight,
          width: ClassMediaQuery.screenWidth,
        ),
      ),
    );
  }
}



