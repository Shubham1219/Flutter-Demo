//Check for internet Connection
import 'dart:io';

import 'package:sample_app/services/Locator.dart';
import 'package:sample_app/services/NavigationService.dart';

Future<bool> isConnectedToInternet() async {
  try {
    final result = await InternetAddress.lookup('google.com')
        .timeout(const Duration(seconds: 5));
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } catch (_) {
    return false;
  }
}
void navigateWithNoBackStackScreen(routeName){
  NavigationService _navigationService = locator<NavigationService>();
  _navigationService.navigateWithRemovingAllPrevious(routeName);
}

void navigateWithBackStackScreen(routeName){
  NavigationService _navigationService = locator<NavigationService>();
  _navigationService.navigateWithBack(routeName);
}
