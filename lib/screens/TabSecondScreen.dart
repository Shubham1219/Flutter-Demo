import 'package:flutter/material.dart';

class TabSecondScreen extends StatelessWidget {
  const TabSecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('It is a camera tab',
          style: TextStyle(fontSize: 35.0),
        ),
      ),
    );
  }
}

