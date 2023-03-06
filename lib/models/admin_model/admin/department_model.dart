class AtmDepartmentAdminModel
{
  bool? status;
  String? message;
  List<DepartmentAdminDataModel>? data =[];

  AtmDepartmentAdminModel.fromJson(Map<String, dynamic> json)
  {

    status = json['status'];
    message = json['message'];
    json['data'].forEach((element)
    {
      data!.add(DepartmentAdminDataModel.fromJson(element));
    });

  }


}

class DepartmentAdminDataModel
{
   String? id;
   String? departmentName;
   String? createdAt;
   String? updatedAt;
   DepartmentAdminHeadModel? The_Head;

   DepartmentAdminDataModel.fromJson(Map<String, dynamic> json)
   {

     id = json['_id'];
     departmentName = json['departmentName'];
     createdAt = json['createdAt'];
     updatedAt = json['updatedAt'];
     The_Head = json['The_Head'] != null ?DepartmentAdminHeadModel.fromJson(json['The_Head']) : null;

   }

}

class DepartmentAdminHeadModel
{
  String? id;
  String? fristName;
  String? lastName;
  String? email;
  String? password;
  bool? verified;
  String? createdAt;
  String? updatedAt;

  DepartmentAdminHeadModel.fromJson(Map<String, dynamic> json)
  {

    id = json['_id'];
    fristName = json['fristName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    verified = json['verified'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];

  }

}
