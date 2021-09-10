import 'dart:convert';
import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sample_app/models/request_model/SignUpRequest.dart';
import 'package:sample_app/preference/SharedPreference.dart';
import 'package:sample_app/utitlities/Widgets.dart';
import 'package:sample_app/utitlities/common_functions.dart';
import 'package:sample_app/utitlities/routes_constants.dart';
import 'package:sample_app/utitlities/utilities.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String countryCode = '+91';
  FocusNode emailFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  FocusNode lastNameFocus = FocusNode();
  FocusNode firstNameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

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
            SizedBox(
              height: 15,
            ),
            _userImage(),
            SizedBox(
              height: 15,
            ),
            _firstNameTextField('Enter Your First Name'),
            SizedBox(
              height: 10,
            ),
            _lastNameTextField('Enter Your Last Name'),
            SizedBox(
              height: 10,
            ),
            _emailTextField('Enter Your Email Id'),
            SizedBox(
              height: 10,
            ),
            _phoneNumberTextField('Enter Your Phone Number'),
            SizedBox(
              height: 10,
            ),
            _passwordTextField('Enter Password'),
            SizedBox(
              height: 20,
            ),
            button('Register', () {
              _createAcc();
            })
          ],
        ),
      ),
    );
  }

  Widget _userImage() {
    return Center(
      child: GestureDetector(
        onTap: () {
          _showPicker(context);
        },
        child: CircleAvatar(
          radius: 55,
          backgroundColor: Color(0xffFDCF09),
          child: path != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.file(
                    File(path!),
                    width: 100,
                    height: 100,
                    fit: BoxFit.fitHeight,
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(50)),
                  width: 100,
                  height: 100,
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.grey[800],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _firstNameTextField(String hint) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
          height: 60,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: TextField(
              controller: firstNameController,
              decoration: InputDecoration.collapsed(
                hintText: hint,
              ),
            ),
          )),
    );
  }

  Widget _lastNameTextField(String hint) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
          height: 60,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: TextField(
              controller: lastNameController,
              decoration: InputDecoration.collapsed(
                hintText: hint,
              ),
            ),
          )),
    );
  }

  Widget _emailTextField(String hint) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
          height: 60,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration.collapsed(
                hintText: hint,
              ),
            ),
          )),
    );
  }

  Widget _phoneNumberTextField(String hint) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
          height: 60,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 15,
                ),
                InkWell(
                    onTap: () {
                      showCountryPicker(
                          context: context,
                          countryListTheme: CountryListThemeData(
                            flagSize: 25,
                            backgroundColor: Colors.white,
                            textStyle:
                                TextStyle(fontSize: 16, color: Colors.blueGrey),
                            //Optional. Sets the border radius for the bottomsheet.
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                            //Optional. Styles the search field.
                            inputDecoration: InputDecoration(
                              labelText: 'Search',
                              hintText: 'Start typing to search',
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      const Color(0xFF8C98A8).withOpacity(0.2),
                                ),
                              ),
                            ),
                          ),
                          onSelect: (Country country) {
                            setState(() {
                              countryCode = country.countryCode;
                            });
                          });
                    },
                    child: Text(countryCode)),
                SizedBox(
                  width: 15,
                ),
                Flexible(
                  child: TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration.collapsed(
                      hintText: hint,
                      // Only numbers can be entered
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  _imgFromCamera() async {
    XFile? image = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (image != null) {
        path = image.path.toString();
      }
    });
  }

  String? path;
  ImagePicker picker = ImagePicker();

  _imgFromGallery() async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        path = image.path.toString();
      }
    });
  }

  Widget _passwordTextField(String hint) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
          height: 60,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration.collapsed(
                hintText: hint,
              ),
            ),
          )),
    );
  }

  _createAcc() async {
    removeFocus(context);
    String email = emailController.text;
    String phone = phoneController.text;
    String lastName = lastNameController.text;
    String firstName = firstNameController.text;
    String password = passwordController.text;

    if (firstName.isEmpty && firstName.length < 3) {
      showAlert(context, 'Please enter valid firstName', () {
        this.firstNameController.clear();
        FocusScope.of(context).requestFocus(firstNameFocus);
      });
      return;
    } else if (lastName.isEmpty && lastName.length < 3) {
      showAlert(context, 'Please enter valid lastName', () {
        this.lastNameController.clear();
        FocusScope.of(context).requestFocus(lastNameFocus);
      });
      return;
    } else if (!validateEmail(email)) {
      showAlert(context, 'Please enter valid email', () {
        this.emailController.clear();
        FocusScope.of(context).requestFocus(emailFocus);
      });
      return;
    } else if (validatePhoneNo(phone)) {
      showAlert(context, 'Please enter valid Phone Number', () {
        this.phoneController.clear();
        FocusScope.of(context).requestFocus(phoneFocus);
      });
      return;
    } else if (!validatePassword(password)) {
      showAlert(context, 'Please enter valid password', () {
        this.passwordController.clear();
        FocusScope.of(context).requestFocus(passwordFocus);
      });
      return;
    }
    SignUpRequest signUpRequest = SignUpRequest(firstName: firstName, lastName: lastName, email: email, countryCode: countryCode, phoneNumber: phone, image: "userImage");

    await SharedPreference.setUserData(json.encode(signUpRequest).toString());

    // await SharedPreference.getUserData();
    SharedPreference.getUserData().then((value) {
      print(value);
    });



    // navigateWithNoBackStackScreen(Dashboard_Screen);
  }
}
