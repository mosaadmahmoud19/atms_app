


import 'package:atms_app/models/register_model.dart';

abstract class AtmsRegisterStates {}

class AtmsRegisterInitialState extends AtmsRegisterStates {}

class AtmsRegisterLoadingState extends AtmsRegisterStates {}

class AtmsRegisterSuccessState extends AtmsRegisterStates
{
 final AtmsRegisterModel  atmsRegisterModel;

  AtmsRegisterSuccessState(this.atmsRegisterModel);


}

class AtmsRegisterErrorState extends AtmsRegisterStates
{
  final String error;

  AtmsRegisterErrorState(this.error);
}

class AtmsRegisterChangePasswordVisibilityState extends AtmsRegisterStates {}

class AtmsRegisterChangeDropDownItemsState extends AtmsRegisterStates {}
