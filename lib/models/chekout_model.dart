class AtmsCheckOutModel
{

  String? message;
  late bool status;



  AtmsCheckOutModel.fromJson(Map<String, dynamic> json)
  {

    message = json['message'];
    status = json['status'];

  }
}