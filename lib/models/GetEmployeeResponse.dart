import 'package:sample_app/models/SuccessResponse.dart';

class GetEmployeeResponse extends SuccessResponse {

   List<EmployeeData> data = [];

  GetEmployeeResponse.fromJson(parsedJson) {
    message = parsedJson['message'];
    if(parsedJson['data']!=null){
      List<EmployeeData> list = [];
      for(int i=0; i<parsedJson['data'].length; i++){
        EmployeeData value = EmployeeData(parsedJson['data'][i]);
        list.add(value);
      }
      data = list;
    }

  }
}

class EmployeeData {
  late int id;
  late String employeeName;
  late int employeeSalary;
  late int employeeAge;

  EmployeeData(parsedJson){
    id = parsedJson['id'];
    employeeName = parsedJson['employee_name'];
    employeeSalary = parsedJson['employee_salary'];
    employeeAge = parsedJson['employee_age'];
  }
}
