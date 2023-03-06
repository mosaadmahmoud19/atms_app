class AtmsCheckInModel
{

  String? message;
  late bool status;



  AtmsCheckInModel.fromJson(Map<String, dynamic> json)
  {

    message = json['message'];
    status = json['status'];

  }
}