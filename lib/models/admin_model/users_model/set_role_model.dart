class AtmsSetRoleAdminModel
{

  String? message;
  late bool status;



  AtmsSetRoleAdminModel.fromJson(Map<String, dynamic> json)
  {

    message = json['message'];
    status = json['status'];

  }
}