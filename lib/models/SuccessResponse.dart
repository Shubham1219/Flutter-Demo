class SuccessResponse{

 late int statusCode;
 late String message;

  SuccessResponse(json){
    statusCode = json['status_code'];
    message = json['message'];
  }

}