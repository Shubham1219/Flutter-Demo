import 'package:flutter/material.dart';
import 'package:sample_app/utitlities/ImageConstants.dart';
import 'package:sample_app/utitlities/Widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'SIGN UP',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _image(),
            SizedBox(
              height: 15,
            ),
            _nameTextField('Enter Your First Name'),
            SizedBox(
              height: 10,
            ),
            _nameTextField('Enter Your Last Name'),
            SizedBox(
              height: 10,
            ),
            _nameTextField('Enter Your Email Id'),
            SizedBox(
              height: 10,
            ),
            _nameTextField('Enter Your Phone Number'),
            SizedBox(
              height: 20,
            ),
            button('Register', (){
              Navigator.pop(context);
            })
          ],
        ),
      ),
    );
  }

  Widget _image() {
    return Container(
        alignment: Alignment.center,
        child: circleImage(ImageConstants.loginLogo));
  }

  Widget _nameTextField(String hint) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
          height: 70,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: TextField(
              decoration: InputDecoration.collapsed(
                hintText: hint,
              ),
            ),
          )),
    );
  }



}
