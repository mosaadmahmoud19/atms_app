class AtmsDeleteDepartmentModel
{

  String? message;
   bool? status;



  AtmsDeleteDepartmentModel.fromJson(Map<String, dynamic> json)
  {

    message = json['message'];
    status = json['status'];

  }
}