class AtmAddNewDepartmentAdminModel
{
   bool? status;
   String? message;
   AtmSectionDepartmentAdminModel? Department;


  AtmAddNewDepartmentAdminModel.fromJson(Map<String, dynamic> json)
  {

    status = json['status'];
    message = json['message'];
    Department = json['Department'] != null ?AtmSectionDepartmentAdminModel.fromJson(json['Department']) : null;

  }


}

class AtmSectionDepartmentAdminModel
{
   String? departmentName;
   String? The_Head;
   String? id;
   String? createdAt;
   String? updatedAt;

  AtmSectionDepartmentAdminModel.fromJson(Map<String, dynamic> json)
  {

    departmentName = json['departmentName'];
    The_Head = json['The_Head'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];


  }


}
