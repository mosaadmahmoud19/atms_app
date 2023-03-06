import 'package:atms_app/models/register_model.dart';
import 'package:atms_app/modules/register/cubit/states.dart';
import 'package:atms_app/shared/network/end_points.dart';
import 'package:atms_app/shared/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AtmsRegisterCubit extends Cubit<AtmsRegisterStates> {
  AtmsRegisterCubit() : super(AtmsRegisterInitialState());

  static AtmsRegisterCubit get(context) => BlocProvider.of(context);

  late AtmsRegisterModel atmsRegisterModel;


  void userRegister({
    required String firstName,
    required String lastName,
    required String email,
    required String password,


  })
  {
    emit(AtmsRegisterLoadingState());

    DioHelper.postData(
      url: 'signUp',
      data:
      {
        'fristName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,

      },

    ).then((value)
    {
       print(value.data.toString());

      atmsRegisterModel = AtmsRegisterModel.fromJson(value.data);
      emit(AtmsRegisterSuccessState(atmsRegisterModel));

    }).catchError((error)
    {
      print(error.toString());
      emit(AtmsRegisterErrorState(error.toString()));
    });
  }



  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(AtmsRegisterChangePasswordVisibilityState());
  }




}
