import 'package:flutter/material.dart';
import 'package:sample_app/bloc/home_bloc.dart';
import 'package:sample_app/models/GetEmployeeResponse.dart';
import 'package:sample_app/screens/EmployeeListItem.dart';
import 'package:sample_app/utitlities/custom_loader.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({Key? key}) : super(key: key);

  @override
  _EmployeeScreenState createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  HomeBloc request = HomeBloc();
  @override
  Widget build(BuildContext context) {
    request.getEmployeeData(context);
    return Scaffold(
      body: StreamBuilder(
        stream: request.employeeStreamController.stream,
        builder: (BuildContext context, AsyncSnapshot<GetEmployeeResponse> snapshot) {
          if (snapshot.hasData) {
            return EmployeeListItem(employeeData: snapshot.requireData,);
          } else {
            return CustomLoader();
          }
        },
      ),
    );
  }

}
