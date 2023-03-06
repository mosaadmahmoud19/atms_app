class AtmHeadsAdminModel
{
  bool? status;
  String? message;
  List<HeadAdminHeadModel>? users =[];

  AtmHeadsAdminModel.fromJson(Map<String, dynamic> json)
  {

    status = json['status'];
    message = json['message'];
    json['users'].forEach((element)
    {
      users!.add(HeadAdminHeadModel.fromJson(element));
    });

  }


}

class HeadAdminHeadModel
{
   String? id;
   String? fristName;
   String? lastName;
   String? email;
   bool? verified;
   String? createdAt;
   String? updatedAt;
   String? role;
   String? department_name;
   HeadDetailsAdminModel? department;

  HeadAdminHeadModel.fromJson(Map<String, dynamic> json)
  {

    id = json['_id'];
    fristName = json['fristName'];
    lastName = json['lastName'];
    email = json['email'];
    verified = json['verified'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    role = json['role'];
    department_name = json['department_name'];
    department = json['department'] != null ?HeadDetailsAdminModel.fromJson(json['department']) : null;


  }

}

class HeadDetailsAdminModel
{
   String? id;
   String? departmentName;
   String? The_Head;
   String? createdAt;
   String? updatedAt;



  HeadDetailsAdminModel.fromJson(Map<String, dynamic> json)
  {

    id = json['_id'];
    departmentName = json['departmentName'];
    The_Head = json['The_Head'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];

  }

}
