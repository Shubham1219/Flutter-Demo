import 'package:sample_app/models/GetEmployeeResponse.dart';
import 'package:sample_app/models/Response.dart';
import 'package:sample_app/services/ApiService.dart';
import 'package:sample_app/services/api_urls.dart';

class BaseRepo{

  Future<Response> getImage(count) async {
    final response = await ApiService.hit(url: ("$BASE_URL=$count&urls=true&httpsUrls=true"), body: null);
    return Response.fromJson(response);
  }
  Future<GetEmployeeResponse> getEmployee() async {
    final response = await ApiService.hit(url: EMPLOYEE_URL, body: null);
    return GetEmployeeResponse.fromJson(response);
  }

}