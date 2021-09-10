class SignUpRequest{
   String firstName;
   String lastName;
   String email;
   String countryCode;
   String phoneNumber;
   String image;

  SignUpRequest({required this.firstName,required this.lastName,required this.email,required this.countryCode,required this.phoneNumber,required this.image});

   SignUpRequest.fromJson(Map<String, dynamic> json)
       : firstName = json['firstName'],
          lastName = json['lastName'],
         email = json['email'],
          countryCode = json['countryCode'],phoneNumber = json['phoneNumber'],image = json['image'];

   Map<String, dynamic> toJson() => {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'countryCode' : countryCode,
      'phoneNumber' : phoneNumber,
      'image' : image
   };
}