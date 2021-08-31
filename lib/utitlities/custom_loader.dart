import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/utitlities/stuff.dart';

class CustomLoader extends StatefulWidget {
  @override
  _CustomLoaderState createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController myAnimationController;

  late Animation<double> radiusInAnimation;
  late Animation<double> radiusOutAnimation;
  late Animation<double> rotationAnimation;
  double initialRadius = 30;
  double radius = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myAnimationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 2));

    radiusInAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: myAnimationController,
        curve: Interval(0.75, 1.0, curve: Curves.elasticIn)));
    radiusOutAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: myAnimationController,
        curve: Interval(0.0, 0.25, curve: Curves.elasticOut)));
    rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: myAnimationController,
        curve: Interval(0.0, 1.0, curve: Curves.linear)));
    myAnimationController.addListener(() {
      //get called each time animation performed almost 60 time a seconds
      setState(() {
        if (myAnimationController.value >= 0.75 &&
            myAnimationController.value <= 1.0) {
          radius = radiusInAnimation.value * initialRadius;
        } else if (myAnimationController.value >= 0.0 &&
            myAnimationController.value <= 0.25) {
          radius = radiusOutAnimation.value * initialRadius;
        }
      });
    });
    myAnimationController.repeat();
  }

  @override
  void dispose() {
    myAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        child: Center(
          child: RotationTransition(
            turns: rotationAnimation,
            child: Stack(
              children: <Widget>[
                // Dot(30,Colors.white),
                Transform.translate(
                    offset: Offset(radius * cos(pi / 4), radius * sin(pi / 4)),
                    child: Dot(8, appThemeColor)),
                Transform.translate(
                    offset: Offset(
                        radius * cos(2 * pi / 4), radius * sin(2 * pi / 4)),
                    //45
                    child: Dot(8, appThemeColor)),
                Transform.translate(
                    offset: Offset(
                        radius * cos(3 * pi / 4), radius * sin(3 * pi / 4)),
                    //45
                    child: Dot(8, appThemeColor)),
                Transform.translate(
                    offset: Offset(
                        radius * cos(4 * pi / 4), radius * sin(4 * pi / 4)),
                    //90
                    child: Dot(8, appThemeColor)),
                Transform.translate(
                    offset: Offset(
                        radius * cos(5 * pi / 4), radius * sin(5 * pi / 4)),
                    //90
                    child: Dot(8, appThemeColor)),
                Transform.translate(
                    offset: Offset(
                        radius * cos(6 * pi / 4), radius * sin(6 * pi / 4)),
                    //45
                    child: Dot(8, appThemeColor)),
                Transform.translate(
                    offset: Offset(
                        radius * cos(7 * pi / 4), radius * sin(7 * pi / 4)),
                    //90
                    child: Dot(8, appThemeColor)),
                Transform.translate(
                    offset: Offset(
                        radius * cos(8 * pi / 4), radius * sin(8 * pi / 4)),
                    //30
                    child: Dot(8, appThemeColor))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  double radius;
  Color color;

  Dot(this.radius, this.color);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        width: this.radius,
        decoration: BoxDecoration(
          color: this.color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
