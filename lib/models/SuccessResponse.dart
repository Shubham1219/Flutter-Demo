class SuccessResponse{

 late int statusCode;
 late String message;
 SuccessResponse();

 SuccessResponse.exception(String message){
   this.message = message;
 }

 SuccessResponse.fromJson(Map<String, dynamic> parsedJson) {
   statusCode = parsedJson['status'];
   message = parsedJson['message'];
 }

}