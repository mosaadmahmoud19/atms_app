class AtmsRequestModel
{

  String? message;
  late bool status;



  AtmsRequestModel.fromJson(Map<String, dynamic> json)
  {

    message = json['message'];
    status = json['status'];

  }
}