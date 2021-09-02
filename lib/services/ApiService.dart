import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sample_app/utitlities/common_functions.dart';
import 'message.dart';

class ApiService {
  static final Duration _timeoutDuration = Duration(seconds: 20);
  static Map<String, String> _userHeader = Map();

  static Map errorMap(int statusCode, String message) {
    Map<String, dynamic> map = Map();
    map['statusCode'] = statusCode;
    map['message'] = message;

    return map;
  }

  ApiService(String token) {
    _userHeader['accessToken'] = token;
  }

  static hit({
    required String url,
    dynamic body,
    bool encodeData = false,

  })async {
    try {

      http.Response? response;
      var jsonBody = body;

      if (encodeData) {
        jsonBody = json.encode(body);
      }

      if(apiType.get!=null){
        response = await http
            .get(Uri.parse(url), headers: _userHeader)
            .timeout(_timeoutDuration);
      }else if(apiType.put!=null){
        response = await http
            .put(Uri.parse(url), headers: _userHeader, body: jsonBody)
            .timeout(_timeoutDuration);
      }else if(apiType.post!=null){
        response = await http
            .post(Uri.parse(url), headers: _userHeader, body: jsonBody)
            .timeout(_timeoutDuration);
      }

      // switch (apiType.get) {
      //   case apiType.get:
      //     response = await http
      //         .get(Uri.parse(url), headers: _userHeader)
      //         .timeout(_timeoutDuration);
      //     break;
      //   case apiType.put:
      //     response = await http
      //         .put(Uri.parse(url), headers: _userHeader, body: jsonBody)
      //         .timeout(_timeoutDuration);
      //     break;
      //   case apiType.post:
      //     response = await http
      //         .post(Uri.parse(url), headers: _userHeader, body: jsonBody)
      //         .timeout(_timeoutDuration);
      //     break;
      // }
      print("Response Body:${response!.body}");
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw new Exception('EXCEPTION');
      }
    } on TimeoutException {
      showToast(CONNECTION_TIMEOUT);
      return errorMap(ERROR_CONNECTION_TIMEOUT, CONNECTION_TIMEOUT);
    } on SocketException {
      showToast(SOCKET_EXCEPTION);
      return errorMap(ERROR_SOCKET_EXCEPTION, SOCKET_EXCEPTION);
    } catch (e) {
      print("Exception ::$e");
      showToast(e.toString());
      return errorMap(ERROR_EXCEPTION, ERROR);
    }
  }
}

enum apiType { get, post, put } //delete,option,head,connect ,trace
