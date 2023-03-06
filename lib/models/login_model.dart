class AtmsLoginModel
{
  late bool status;
  String? token;
  UserData? user;
  String? message;

  AtmsLoginModel.fromJson(Map<String, dynamic> json)
  {

    status = json['status'];
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? UserData.fromJson(json['user']) : null;
  }
}

class UserData
{

 late String name;
 late String email;
  String? role;


  // named constructor
  UserData.fromJson(Map<String, dynamic> json)
  {

    name = json['name'];
    email = json['email'];
    role = json['role'];

  }
}