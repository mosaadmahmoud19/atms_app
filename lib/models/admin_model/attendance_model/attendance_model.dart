class AtmAttendanceAdminModel
{
   bool? status;
   List<AttendanceTodayAdminModel>? attendanceToday =[];

  AtmAttendanceAdminModel.fromJson(Map<String, dynamic> json)
  {

    status = json['status'];
    json['attendanceToday'].forEach((element)
    {
      attendanceToday!.add(AttendanceTodayAdminModel.fromJson(element));
    });

  }


}

class AttendanceTodayAdminModel
{
   String? date;
   String? userName;
   String? userEmail;
   String? entry;
   bool? requestToLeave;
   String? id;


  AttendanceTodayAdminModel.fromJson(Map<String, dynamic> json)
  {

    date = json['date'];
    userName = json['userName'];
    userEmail = json['userEmail'];
    entry = json['entry'];
    requestToLeave = json['requestToLeave'];
    id = json['_id'];


  }
}