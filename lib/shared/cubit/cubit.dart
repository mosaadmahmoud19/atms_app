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
import 'package:atms_app/shared/cubit/states.dart';
import 'package:atms_app/shared/network/end_points.dart';
import 'package:atms_app/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AtmsAppCubit extends Cubit<AtmsAppStates> {
  AtmsAppCubit() : super(AtmsAppInitialState());

  static AtmsAppCubit get(context) => BlocProvider.of(context);


  late AtmsCheckInModel atmsCheckInModel;

  late AtmsCheckOutModel  atmsCheckOutModel;

  late AtmsRequestModel atmsRequestModel  ;

  late AtmDepartmentAdminModel atmDepartmentAdminModel;



  void chekInUser({
    required String uidLogin,
  })
  {

    emit(AtmsAppChekInLoadingState());

    DioHelper.postData(
      url: ENTER,
      token: uidLogin,

    ).then((value)
    {
      print('data chekin suceess ');
      print(value.data);
      atmsCheckInModel = AtmsCheckInModel.fromJson(value.data);
      emit(AtmsAppChekInSuccessState(atmsCheckInModel));

    }).catchError((error)
    {
      print('data chekin ERRRRRRRRRR');

      print(error.toString());
      emit(AtmsAppChekInErrorState(error.toString()));
    });
  }

  void chekOutUser({
    required String uidLogin,
  })
  {

    emit(AtmsAppChekOutLoadingState());

    DioHelper.postData(
      url: EXITE,
      token: uidLogin,

    ).then((value)
    {
      print('data chekout suceess ');
      print(value.data);
      atmsCheckOutModel = AtmsCheckOutModel.fromJson(value.data);
      emit(AtmsAppChekOutSuccessState(atmsCheckOutModel));

    }).catchError((error)
    {
      print('data chekout ERRRRRRRRRR');

      print(error.toString());
      emit(AtmsAppChekOutErrorState(error.toString()));
    });
  }

  void userRequest({
    required String name,
    required String email,
    required String reason,
    required String uidRequest,

  })
  {
    emit(AtmsRequestLoadingState());

    DioHelper.postData(
      url: LEAVEREQUEST,
      token: uidRequest,
      data:
      {
        'name': name,
        'email': email,
        'reason': reason,
      },

    ).then((value)
    {
      print(value.data.toString());

      atmsRequestModel = AtmsRequestModel.fromJson(value.data);
      emit(AtmsRequestSuccessState(atmsRequestModel));

    }).catchError((error)
    {
      print(error.toString());
      emit(AtmsRequestErrorState(error.toString()));
    });
  }

  void getDepartments({
    required String token,
})
  {
    DioHelper.getData(
      url: DEPARTMENTS,
      token: token,
    ).then((value) {

      atmDepartmentAdminModel = AtmDepartmentAdminModel.fromJson(value.data);
    //  print(atmDepartmentAdminModel.data[0].departmentName);
      emit(AtmsDepartmentSuccessState(atmDepartmentAdminModel));
    }).catchError((error) {
      print(error.toString());
      emit(AtmsDepartmentErrorState(error.toString()));
    });
  }

 late AtmAddNewDepartmentAdminModel atmAddNewDepartmentAdminModel;

  void addNewDepartment({
    required String departmentName,
    required String email,
    required String uidAdd,
  })
  {

    emit(AtmsNewAddDepartmentLoadingState());

    DioHelper.postData(
      url: ADDNEWDEPARTMENT,
      token: uidAdd,
      data:
      {
        'departmentName': departmentName,
        'email': email,
      }

    ).then((value)
    {
      print('data Add New success ');
      print(value.data);
      atmAddNewDepartmentAdminModel = AtmAddNewDepartmentAdminModel.fromJson(value.data);

      // emit(AtmsNewAddDepartmentSuccessState(atmAddNewDepartmentAdminModel));
      getDepartments(
        token:uidAdd,
      );
    }).catchError((error)
    {
      print('data Add New Error');

      print(error.toString());
      emit(AtmsNewAddDepartmentErrorState(error.toString()));
    });
  }

  late AtmsUpdateDepartmentModel atmsUpdateDepartmentModel;

  void updateDepartment({
    required String departmentName,
    required String email,
    required String uidUpdate,
  })
  {

    emit(AtmsUpdateDepartmentLoadingState());

    DioHelper.putData(
        url: UPDATEDEPARTMENT,
        token: uidUpdate,
        data:
        {
          'departmentName': departmentName,
          'email': email,
        }

    ).then((value)
    {

      print(value.data);
      atmsUpdateDepartmentModel = AtmsUpdateDepartmentModel.fromJson(value.data);
      getDepartments(
        token:uidUpdate,
      );

      // emit(AtmsUpdateDepartmentSuccessState(atmsUpdateDepartmentModel));


    }).catchError((error)
    {
      print('data update Error');
      print(error.toString());
      emit(AtmsUpdateDepartmentErrorState(error.toString()));
    });
  }

  late AtmsDeleteDepartmentModel atmsDeleteDepartmentModel;

  void deleteDepartment({
    required String departmentName,
    required String uidDelete,
  })
  {

    emit(AtmsDeleteDepartmentLoadingState());

    DioHelper.deleteData(
        url: DELETEDEPARTMENT,
        token: uidDelete,
        data:
        {
          'departmentName': departmentName,
        }

    ).then((value)
    {
      print('data delete success');
      print(value.data);
      atmsDeleteDepartmentModel = AtmsDeleteDepartmentModel.fromJson(value.data);
      getDepartments(
        token:uidDelete,
      );

      // emit(AtmsDeleteDepartmentSuccessState(atmsDeleteDepartmentModel));

    }).catchError((error)
    {
      print('data delete Error');
      print(error.toString());
      emit(AtmsDeleteDepartmentErrorState(error.toString()));
    });
  }


 late AtmAttendanceAdminModel atmAttendanceAdminModel;
  void getUserAttendance()
  {
    DioHelper.getData(
      url: ATTENDANCE,

    ).then((value) {

      print('attendance data');

      atmAttendanceAdminModel = AtmAttendanceAdminModel.fromJson(value.data);

       print(atmAttendanceAdminModel.attendanceToday![0].userName);

      emit(AtmsAttendanceSuccessState(atmAttendanceAdminModel));
    }).catchError((error) {
      print(error.toString());
      emit(AtmsAttendanceErrorState(error.toString()));
    });
  }

 late AtmEmployeeAdminModel atmEmployeeAdminModel;

  void getEmployee({
    required String token,
  })
  {
    emit(AtmsEmployeeLoadingState());
    DioHelper.getData(
      url: EMPLOYEE,
      token: token
    ).then((value)
    {
      print(value.data.toString());

      atmEmployeeAdminModel = AtmEmployeeAdminModel.fromJson(value.data);

      // print(atmDepartmentAdminModel.data[0].departmentName);

      emit(AtmsEmployeeSuccessState(atmEmployeeAdminModel));
    }).catchError((error) {
      print(error.toString());
      emit(AtmsEmployeeErrorState(error.toString()));
    });
  }


  late AtmHeadsAdminModel atmHeadsAdminModel;

  void getHead({
    required String token,
  })
  {
    emit(AtmsHeadLoadingState());
    DioHelper.getData(
        url: HEADS,
        token: token
    ).then((value)
    {
      print(value.data.toString());

      atmHeadsAdminModel = AtmHeadsAdminModel.fromJson(value.data);

      // print(atmDepartmentAdminModel.data[0].departmentName);

      emit(AtmsHeadSuccessState(atmHeadsAdminModel));
    }).catchError((error) {
      print(error.toString());
      emit(AtmsHeadErrorState(error.toString()));
    });
  }

  late AtmsSetRoleAdminModel atmsSetRoleAdminModel;

  void sendSetRole({
    required String role,
    required String email,
    required String token,
  })
  {

    emit(AtmsSetRoleLoadingState());

    DioHelper.postData(
        url: SETROLE,
        token: token,
        data:
        {
          'email': email,
          'role': role,
        }

    ).then((value)
    {
      print('set Role Success ');
      print(value.data);
      atmsSetRoleAdminModel = AtmsSetRoleAdminModel.fromJson(value.data);

      emit(AtmsSetRoleSuccessState(atmsSetRoleAdminModel));

    }).catchError((error)
    {
      print('set Role Error');

      print(error.toString());
      emit(AtmsSetRoleErrorState(error.toString()));
    });
  }

  late AtmsSetDepartmentAdminModel atmsSetDepartmentAdminModel;

  void sendSetDepartment({
    required String email,
    required String departmentName,
    required String token,
  })
  {

    emit(AtmsSetDepartmentLoadingState());

    DioHelper.postData(
        url: SETDEPARTMENT,
        token: token,
        data:
        {
          'email': email,
          'departmentName': departmentName,
        }

    ).then((value)
    {
      print('set department Success ');
      print(value.data);
      atmsSetDepartmentAdminModel = AtmsSetDepartmentAdminModel.fromJson(value.data);

      emit(AtmsSetDepartmentSuccessState(atmsSetDepartmentAdminModel));

    }).catchError((error)
    {
      print('set department Error');

      print(error.toString());
      emit(AtmsSetDepartmentErrorState(error.toString()));
    });
  }


}