import 'package:flutter/material.dart';
import 'package:sample_app/screens/TabFirstScreen.dart';
import 'package:sample_app/screens/TabSecondScreen.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Tab Screen'),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.contacts), text: "Contact Tab"),
                Tab(icon: Icon(Icons.camera_alt), text: "Camera Tab")
              ],
            ),
          ),
          body: TabBarView(
            children: [
              TabFirstScreen(),
              TabSecondScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
