//Check for internet Connection
import 'dart:io';

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