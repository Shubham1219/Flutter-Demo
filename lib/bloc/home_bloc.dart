import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:sample_app/models/GetEmployeeResponse.dart';
import 'package:sample_app/models/Response.dart';
import 'package:sample_app/repository/BaseRepo.dart';
import 'package:sample_app/services/message.dart';
import 'package:sample_app/utitlities/Widgets.dart';
import 'package:sample_app/utitlities/common_functions.dart';
import 'package:sample_app/utitlities/utilities.dart';
import 'BaseBloc.dart';

class HomeBloc extends BaseBloc{
  BaseRepo _repo = BaseRepo();
  StreamController<Response> streamController = StreamController();

  getAllImage(BuildContext context,int count) async {
    if (await isConnectedToInternet()) {
      Response response = await _repo.getImage(count);
      //timer is used to show shimmer animation to little longer
      Timer(Duration(seconds: 5),
              ()=>
              streamController.add(response)
      );
    }else{
      failureWidget(context, ERROR_SOCKET_EXCEPTION, (){
        closeBottomSheet(context);
      });
    }
  }
  StreamController<GetEmployeeResponse> employeeStreamController = StreamController();
  getEmployeeData(BuildContext context) async {
    if (await isConnectedToInternet()) {
      GetEmployeeResponse response = await _repo.getEmployee();
      employeeStreamController.add(response);
    }else{
      failureWidget(context, ERROR_SOCKET_EXCEPTION, (){
        closeBottomSheet(context);
      });
    }
  }

  @override
  dispose() {
    streamController.close();
    employeeStreamController.close();
  }

}