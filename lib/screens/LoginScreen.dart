import 'package:flutter/material.dart';
import 'package:sample_app/services/Locator.dart';
import 'package:sample_app/services/NavigationService.dart';
import 'package:sample_app/utitlities/ImageConstants.dart';
import 'package:sample_app/utitlities/Widgets.dart';
import 'package:sample_app/utitlities/class_media_query.dart';
import 'package:sample_app/utitlities/common_functions.dart';
import 'package:sample_app/utitlities/routes_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: ClassMediaQuery.screenHeight / 5,),
            circleImage(ImageConstants.loginLogo),
            SizedBox(height: 20,),
            _emailTextField(),
            _passwordTextField(),
            SizedBox(height: 20,),
            button('Login', (){
              _navigationService.navigateWithRemovingAllPrevious(Home_Screen);
            }),
            SizedBox(height: 15,),
            textStyleWithMediumSize('OR'),
            SizedBox(height: 15,),
            button('Sign Up', (){
              _navigationService.navigateWithBack(Sign_Up);
            }),


          ],
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        height: 70,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration.collapsed(
                hintText: 'Enter Your Email',
              ),
            ),
          )
      ),
    );
  }

  Widget _passwordTextField() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
          height: 70,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: TextField(
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration.collapsed(
                hintText: 'Enter Your Password',
              ),
            ),
          )
      ),
    );
  }


}
