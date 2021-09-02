import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sample_app/utitlities/Widgets.dart';
import 'package:sample_app/utitlities/routes_constants.dart';
import 'package:sample_app/utitlities/utilities.dart';

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
            SizedBox(
              height: 15,
            ),
            _userImage(),
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
            _phoneNumberTextField('Enter Your Phone Number'),
            SizedBox(
              height: 20,
            ),
            button('Register', () {
              navigateWithNoBackStackScreen(Dashboard_Screen);
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

  Widget _nameTextField(String hint) {
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
          child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: TextFormField(
              decoration: InputDecoration.collapsed(
                hintText: hint,
              ),
                ),
          )
      ),
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
    XFile? image = await picker.pickImage(
        source: ImageSource.camera
    );
    setState(() {
      if(image!=null) {
        path = image.path.toString();
      }
    });

  }

  String? path;
  ImagePicker picker = ImagePicker();
  _imgFromGallery() async {
    XFile? image = await picker.pickImage(
        source: ImageSource.gallery
    );

    setState(() {
      if(image!=null) {
        path = image.path.toString();
      }
    });

  }
}
