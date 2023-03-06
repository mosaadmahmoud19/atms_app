class AtmsSetDepartmentAdminModel
{

  String? message;
  late bool status;



  AtmsSetDepartmentAdminModel.fromJson(Map<String, dynamic> json)
  {

    message = json['message'];
    status = json['status'];

  }
}