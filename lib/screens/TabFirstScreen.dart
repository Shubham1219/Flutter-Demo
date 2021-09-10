import 'package:flutter/material.dart';

class TabFirstScreen extends StatelessWidget {
  const TabFirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text('It is a contact tab',
            style: TextStyle(fontSize: 32.0),
          )
      ),
    );
  }
}

