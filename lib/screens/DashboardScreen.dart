import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_app/screens/PaginationScreen.dart';
import 'package:sample_app/utitlities/Constants.dart';
import 'package:sample_app/utitlities/common_functions.dart';
import 'HomeScreen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool checkForDoubleBackPress = false;
  int selectedItem = 0;
  late List<Widget> widgetOption;

  _DashboardScreenState() {
    widgetOption = <Widget>[
      HomeScreen(),
      PaginationScreen(),
      Text('Payment'),
      Text('Profile')
    ];
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (checkForDoubleBackPress) {
          checkForDoubleBackPress =false;
          SystemNavigator.pop();
        } else {
          showToast(app_exit);
          checkForDoubleBackPress = false;
          Future.delayed(Duration(seconds: 1), () {
            checkForDoubleBackPress = true;
          });
        }
        return checkForDoubleBackPress;
      },
      child: Scaffold(
        body: IndexedStack(
          children: widgetOption,
          index: selectedItem,
        ),
        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.white,
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Colors.blue,
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.grey[500]))),
          // sets the inactive color of the `BottomNavigationBar`
          child: new BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedItem,
            onTap: onTap,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ('Home')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.access_time), label: ('Booking')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.payment), label: ('Pagination')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: ('Account'))
            ],
          ),
        ),
      ),
    );
  }

  void onTap(int index) {
    setState(() {
      selectedItem = index;
    });
  }

}
