import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:sample_app/models/Response.dart';
import 'package:sample_app/repository/BaseRepo.dart';
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
    }
  }

  @override
  dispose() {
    streamController.close();
  }

}