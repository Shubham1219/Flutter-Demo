import 'package:sample_app/models/Response.dart';
import 'package:sample_app/services/ApiService.dart';

class BaseRepo{

  Future<Response> getImage(count) async {
    final response = await ApiService.hit(url: ("http://shibe.online/api/shibes?count=$count&urls=true&httpsUrls=true"), body: null);
    return Response.fromJson(response);
  }
}