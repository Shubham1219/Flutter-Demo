import 'package:flutter/material.dart';
import 'package:sample_app/models/GetEmployeeResponse.dart';
import 'package:sample_app/utitlities/class_media_query.dart';
import 'package:sample_app/utitlities/routes_constants.dart';
import 'package:sample_app/utitlities/utilities.dart';
class EmployeeListItem extends StatelessWidget {
  const EmployeeListItem({
    required this.employeeData,
    Key? key,
  }) : super(key: key);

  final GetEmployeeResponse employeeData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: root(employeeData)
    );
  }

  Widget root(GetEmployeeResponse data) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: ClassMediaQuery.notchHeight,),
          ListView.builder(
            shrinkWrap: true,
            itemCount: data.data.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  navigateWithBackStackScreen(Tab_Bar);
                },
                child: Column(
                  children: [
                    Text(data.data[index].employeeName),
                    Text(data.data[index].employeeAge.toString()),
                    Text(data.data[index].employeeSalary.toString()),
                    Divider(thickness: 2,)
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }



}
