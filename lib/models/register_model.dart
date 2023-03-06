class AtmsRegisterModel
{

  String? message;
  late bool status;



  AtmsRegisterModel.fromJson(Map<String, dynamic> json)
  {

    message = json['message'];
    status = json['status'];

  }
}