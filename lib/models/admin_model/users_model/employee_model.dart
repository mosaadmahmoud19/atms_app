class AtmEmployeeAdminModel
{
   bool? status;
   String? message;
  List<EmployeeAdminDataModel>? users =[];

  AtmEmployeeAdminModel.fromJson(Map<String, dynamic> json)
  {

    status = json['status'];
    message = json['message'];
    json['users'].forEach((element)
    {
      users!.add(EmployeeAdminDataModel.fromJson(element));
    });

  }


}

class EmployeeAdminDataModel
{
   String? id;
   String? fristName;
   String? lastName;
   String? email;
   bool? verified;
   String? role;
   String? createdAt;
   String? updatedAt;
   String? department_name;
   EmployeeDetailsAdminModel? department;


  EmployeeAdminDataModel.fromJson(Map<String, dynamic> json)
  {

    id = json['_id'];
    fristName = json['fristName'];
    lastName = json['lastName'];
    email = json['email'];
    verified = json['verified'];
    role = json['role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    department_name = json['department_name'];

    department = json['department'] != null ?EmployeeDetailsAdminModel.fromJson(json['department']) : null;



  }

}

class EmployeeDetailsAdminModel
{
   String? id;
   String? departmentName;
   String? The_Head;
   String? createdAt;
   String? updatedAt;



  EmployeeDetailsAdminModel.fromJson(Map<String, dynamic> json)
  {

    id = json['_id'];
    departmentName = json['departmentName'];
    The_Head = json['The_Head'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];

  }

}

