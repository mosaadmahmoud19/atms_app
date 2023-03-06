
import 'package:atms_app/models/admin_model/admin/add_newdepartment_model.dart';
import 'package:atms_app/models/admin_model/admin/delete_department_model.dart';
import 'package:atms_app/models/admin_model/admin/department_model.dart';
import 'package:atms_app/models/admin_model/admin/update_department_model.dart';
import 'package:atms_app/models/admin_model/attendance_model/attendance_model.dart';
import 'package:atms_app/models/admin_model/users_model/employee_model.dart';
import 'package:atms_app/models/admin_model/users_model/head_model.dart';
import 'package:atms_app/models/admin_model/users_model/set_department_model.dart';
import 'package:atms_app/models/admin_model/users_model/set_role_model.dart';
import 'package:atms_app/models/chekin_model.dart';
import 'package:atms_app/models/chekout_model.dart';
import 'package:atms_app/models/request_model.dart';

abstract class AtmsAppStates {}

class AtmsAppInitialState extends AtmsAppStates {}

// Check In
class AtmsAppChekInLoadingState extends AtmsAppStates {}

class AtmsAppChekInSuccessState extends AtmsAppStates
{
  final AtmsCheckInModel  checkInModel;

  AtmsAppChekInSuccessState(this.checkInModel);

}

class AtmsAppChekInErrorState extends AtmsAppStates
{
  final String error;

  AtmsAppChekInErrorState(this.error);

}

//Chek Out

class AtmsAppChekOutLoadingState extends AtmsAppStates {}

class AtmsAppChekOutSuccessState extends AtmsAppStates
{
  final AtmsCheckOutModel  checkOutModel;

  AtmsAppChekOutSuccessState(this.checkOutModel);


}

class AtmsAppChekOutErrorState extends AtmsAppStates
{
  final String error;

  AtmsAppChekOutErrorState(this.error);


}

// Request

class AtmsRequestLoadingState extends AtmsAppStates {}

class AtmsRequestSuccessState extends AtmsAppStates
{
  final AtmsRequestModel  atmsRequestModel;

  AtmsRequestSuccessState(this.atmsRequestModel);


}

class AtmsRequestErrorState extends AtmsAppStates
{
  final String error;

  AtmsRequestErrorState(this.error);


}

// department

class AtmsDepartmentLoadingState extends AtmsAppStates {}

class AtmsDepartmentSuccessState extends AtmsAppStates
{
  final AtmDepartmentAdminModel atmDepartmentAdminModel  ;

  AtmsDepartmentSuccessState(this.atmDepartmentAdminModel);


}

class AtmsDepartmentErrorState extends AtmsAppStates
{
  final String error;

  AtmsDepartmentErrorState(this.error);


}

// AddNewDepartment

class AtmsNewAddDepartmentLoadingState extends AtmsAppStates {}

class AtmsNewAddDepartmentSuccessState extends AtmsAppStates
{
  final AtmAddNewDepartmentAdminModel  atmAddNewDepartmentAdminModel ;

  AtmsNewAddDepartmentSuccessState(this.atmAddNewDepartmentAdminModel);


}

class AtmsNewAddDepartmentErrorState extends AtmsAppStates
{
  final String error;

  AtmsNewAddDepartmentErrorState(this.error);


}

// DeleteDepartment

class AtmsDeleteDepartmentLoadingState extends AtmsAppStates {}

class AtmsDeleteDepartmentSuccessState extends AtmsAppStates
{
  final AtmsDeleteDepartmentModel  atmsDeleteDepartmentModel ;

  AtmsDeleteDepartmentSuccessState(this.atmsDeleteDepartmentModel);

}

class AtmsDeleteDepartmentErrorState extends AtmsAppStates
{
  final String error;

  AtmsDeleteDepartmentErrorState(this.error);

}

// UpdateDepartment

class AtmsUpdateDepartmentLoadingState extends AtmsAppStates {}

class AtmsUpdateDepartmentSuccessState extends AtmsAppStates
{
  final AtmsUpdateDepartmentModel  atmsUpdateDepartmentModel ;

  AtmsUpdateDepartmentSuccessState(this.atmsUpdateDepartmentModel);


}

class AtmsUpdateDepartmentErrorState extends AtmsAppStates
{
  final String error;

  AtmsUpdateDepartmentErrorState(this.error);

}

// Attendance

class AtmsAttendanceLoadingState extends AtmsAppStates {}

class AtmsAttendanceSuccessState extends AtmsAppStates
{
  final AtmAttendanceAdminModel  atmAttendanceAdminModel;

  AtmsAttendanceSuccessState(this.atmAttendanceAdminModel);

}

class AtmsAttendanceErrorState extends AtmsAppStates
{
  final String error;

  AtmsAttendanceErrorState(this.error);

}

// Employee

class AtmsEmployeeLoadingState extends AtmsAppStates {}

class AtmsEmployeeSuccessState extends AtmsAppStates
{
  final AtmEmployeeAdminModel  atmEmployeeAdminModel;

  AtmsEmployeeSuccessState(this.atmEmployeeAdminModel);


}

class AtmsEmployeeErrorState extends AtmsAppStates
{
  final String error;

  AtmsEmployeeErrorState(this.error);

}

// head


class AtmsHeadLoadingState extends AtmsAppStates {}

class AtmsHeadSuccessState extends AtmsAppStates
{
  final AtmHeadsAdminModel  atmHeadsAdminModel;

  AtmsHeadSuccessState(this.atmHeadsAdminModel);


}

class AtmsHeadErrorState extends AtmsAppStates
{
  final String error;

  AtmsHeadErrorState(this.error);

}

//setRole


class AtmsSetRoleLoadingState extends AtmsAppStates {}

class AtmsSetRoleSuccessState extends AtmsAppStates
{
  final AtmsSetRoleAdminModel  atmsSetRoleAdminModel ;

  AtmsSetRoleSuccessState(this.atmsSetRoleAdminModel);

}

class AtmsSetRoleErrorState extends AtmsAppStates
{
  final String error;

  AtmsSetRoleErrorState(this.error);


}


// setDepartment


class AtmsSetDepartmentLoadingState extends AtmsAppStates {}

class AtmsSetDepartmentSuccessState extends AtmsAppStates
{
  final AtmsSetDepartmentAdminModel  atmsSetDepartmentAdminModel;

  AtmsSetDepartmentSuccessState(this.atmsSetDepartmentAdminModel);


}

class AtmsSetDepartmentErrorState extends AtmsAppStates
{
  final String error;

  AtmsSetDepartmentErrorState(this.error);

}





