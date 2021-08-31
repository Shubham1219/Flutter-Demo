

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/services/message.dart';
import 'package:sample_app/utitlities/stuff.dart';

import 'class_media_query.dart';
import 'colors.dart';

Widget circleImage(String name){
  return ClipRRect(
    borderRadius: BorderRadius.circular(8.0),
    child: Image.asset(
      name,
      height: 150.0,
      width: 100.0,
    ),
  );
}

Widget button(String text,Function onClick){
  return InkWell(
    onTap: () {
      if (onClick != null) {
        onClick();
      }
    },
    child: Container(
      width: ClassMediaQuery.screenWidth,
      margin: EdgeInsets.only(left: 10,right: 10),
      height: 50,
      decoration: BoxDecoration(
          color: button_color ,
          borderRadius: BorderRadius.all(Radius.circular(30))
      ),
      child: Center(
          child: Text(
            text,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),
          )
      ),

    ),
  );
}

//close popup
closePopUp(context){
  Navigator.pop(context);
}

failureWidget(BuildContext context, int statusCode, Function onclick) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return caseFailure(
           statusCode, CONNECTION_ERROR,  onclick);
    },
  );
}

 caseFailure( int statusCode,  String message,  Function onclick) {
  switch (statusCode) {
    case ERROR_CONNECTION_TIMEOUT:
     return timeoutWidget(message, onclick);
    case ERROR_SOCKET_EXCEPTION:
      return internetFailureWidget(message, onclick);
    case ERROR_EXCEPTION:
      return apiError();
  }
}

Widget timeoutWidget(String message, Function onClick) {
  return Container(
    height: ClassMediaQuery.blockSizeVertical * 40,
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Gothic',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.cloud_off,
                color: redBtnColor,
              ),
            ],
          ),
          separatorLineText('Server Timeout!!'),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 40.0,
            padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
            child: MaterialButton(
              color: redBtnColor,
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                'Retry',
                style: styleButton(Colors.white),
              ),
              onPressed: () {
                if (onClick != null) {
                  onClick();
                }
              },
            ),
          ),
        ],
      ),
    ),
  );
}

Widget internetFailureWidget(String message, Function onClick) {
  return Container(
    height: ClassMediaQuery.blockSizeVertical * 40,
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Gothic',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.signal_wifi_off,
                color: redBtnColor,
              ),
              SizedBox(
                width: 30,
              ),
              Icon(
                Icons.signal_cellular_connected_no_internet_4_bar,
                color: redBtnColor,
              )
            ],
          ),
          separatorLineText('Neither Wifi Nor Data'),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 40.0,
            padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
            child: MaterialButton(
              color: redBtnColor,
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                'Retry',
                style: styleButton(Colors.white),
              ),
              onPressed: () {
                if (onClick != null) {
                  onClick();
                }
              },
            ),
          ),
        ],
      ),
    ),
  );
}

Widget apiError() {
  return Container(
    height: ClassMediaQuery.blockSizeVertical * 40,
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'API ERROR',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Gothic',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.signal_wifi_off,
                color: redBtnColor,
              ),
              SizedBox(
                width: 30,
              ),
              Icon(
                Icons.signal_cellular_connected_no_internet_4_bar,
                color: redBtnColor,
              )
            ],
          ),
          separatorLineText('API ERROR'),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 40.0,
            padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
            child: MaterialButton(
              color: redBtnColor,
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              onPressed: () {  },
              child: Text(
                'Retry',
                style: styleButton(Colors.white),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget separatorLineText(String text) {
  return Row(children: <Widget>[
    Expanded(
      child: new Container(
          margin: const EdgeInsets.only(left: 50.0, right: 5.0),
          child: Divider(
            color: Colors.grey,
            height: 50,
          )),
    ),
    Text(
      text,
      style: TextStyle(
        fontFamily: 'Gothic',
        color: Colors.grey,
        fontSize: 12,
      ),
    ),
    Expanded(
      child: new Container(
          margin: const EdgeInsets.only(left: 5.0, right: 50.0),
          child: Divider(
            color: Colors.grey,
            height: 50,
          )),
    ),
  ]);
}


