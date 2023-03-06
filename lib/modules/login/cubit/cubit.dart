import 'package:atms_app/models/login_model.dart';
import 'package:atms_app/modules/login/cubit/states.dart';
import 'package:atms_app/shared/network/end_points.dart';
import 'package:atms_app/shared/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AtmsLoginCubit extends Cubit<AtmsLoginStates> {
  AtmsLoginCubit() : super(AtmsLoginInitialState());

  static AtmsLoginCubit get(context) => BlocProvider.of(context);

 late AtmsLoginModel atmsLoginModel;


  late AtmsLoginModel atmsRegisterModel;




  void userLogin({
    required String email,
    required String password,
  })
  {
    emit(AtmsLoginLoadingState());

    DioHelper.postData(
      url: SIGNIN,
      data:
      {
        'email': email,
        'password': password,
      },
    ).then((value)
    {
      print(value.data);
      atmsLoginModel = AtmsLoginModel.fromJson(value.data);
      emit(AtmsLoginSuccessState(atmsLoginModel));
    }).catchError((error)
    {
      print(error.toString());
      emit(AtmsLoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(AtmsChangePasswordVisibilityState());
  }


}
