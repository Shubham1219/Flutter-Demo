import 'package:flutter/material.dart';
import 'package:sample_app/services/Locator.dart';
import 'package:sample_app/services/NavigationService.dart';
import 'package:sample_app/services/Router.dart' as router;

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(26, 42, 68, 1.0),
        fontFamily: 'Gothic',
      ),
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: router.generateRoute,
    );
  }
}
