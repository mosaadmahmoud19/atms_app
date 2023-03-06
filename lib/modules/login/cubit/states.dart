
import 'package:atms_app/models/login_model.dart';

abstract class AtmsLoginStates {}

class AtmsLoginInitialState extends AtmsLoginStates {}

class AtmsLoginLoadingState extends AtmsLoginStates {}

class AtmsLoginSuccessState extends AtmsLoginStates
{
  final AtmsLoginModel atmsLoginModel;

  AtmsLoginSuccessState(this.atmsLoginModel);
}

class AtmsLoginErrorState extends AtmsLoginStates
{
  final String error;

  AtmsLoginErrorState(this.error);
}

class AtmsChangePasswordVisibilityState extends AtmsLoginStates {}

class AtmsLoginChangeDropDownItemsState extends AtmsLoginStates {}
