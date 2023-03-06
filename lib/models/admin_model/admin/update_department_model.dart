class AtmsUpdateDepartmentModel
{

  String? message;
   bool? status;



  AtmsUpdateDepartmentModel.fromJson(Map<String, dynamic> json)
  {

    message = json['message'];
    status = json['status'];

  }
}