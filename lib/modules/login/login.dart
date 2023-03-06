

import 'package:atms_app/modules/admin_pannel/addmin/home_page.dart';
import 'package:atms_app/modules/eployee/home_screen.dart';
import 'package:atms_app/modules/forgot_password.dart';
import 'package:atms_app/modules/login/cubit/cubit.dart';
import 'package:atms_app/modules/login/cubit/states.dart';
import 'package:atms_app/modules/register/cubit/states.dart';
import 'package:atms_app/modules/register/register.dart';
import 'package:atms_app/shared/component/component.dart';
import 'package:atms_app/shared/network/local/cache_helper.dart';
import 'package:atms_app/shared/network/remote/dio_helper.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/component/consant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
 

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AtmsLoginCubit(),
      child:BlocConsumer<AtmsLoginCubit,AtmsLoginStates>(
        listener: (context,state)
        {
          if (state is AtmsLoginSuccessState)
          {
            if (state.atmsLoginModel.status)
            {
              if (state.atmsLoginModel.user?.role == "employee")
              {
                CacheHelper.saveData(
                  key: 'token',
                  value: state.atmsLoginModel.token,
                ).then((value)
                {
                  token = state.atmsLoginModel.token;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  HomeScreen()));

                });

              }

             else if (state.atmsLoginModel.user?.role == "admin")
              {
                CacheHelper.saveData(
                  key: 'token',
                  value: state.atmsLoginModel.token,
                ).then((value)
                {
                  token = state.atmsLoginModel.token;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  HomePage()));
                });

              }

              print(state.atmsLoginModel.user?.role);
            }
            else
            {
              showToast(
                text: state.atmsLoginModel.message,
                state: ToastStates.ERROR,
              );
            }
          }
        },
        builder: (context,state)
        {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "Login Here",
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        Image.asset(
                          "assets/login.jpg",
                          height: 250,
                          width: double.infinity,
                        ),
                        Text(
                          "Get Logged In From Here",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black12,
                              ),
                              color: Colors.grey[100],
                              borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                          child: defaultFormField(
                            onSubmit: (value)
                            {
                              print(value);
                            },

                            controller: emailController,
                            label: 'Email',
                            prefix: Icons.email,
                            type: TextInputType.emailAddress,
                            validate: (String? value)
                            {
                              if(value!.isEmpty)
                              {
                                return 'email must not be empty';
                              }

                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black12,
                              ),
                              color: Colors.grey[100],
                              borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                          child:  defaultFormField(

                            controller: passwordController,
                            label: 'Password',
                            prefix: Icons.lock,
                            suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                            isPassword: isPassword,
                            suffixPressed: ()
                            {
                              setState(()
                              {
                                isPassword = !isPassword;
                              });
                            },
                            type: TextInputType.visiblePassword,
                            validate: (String? value)
                            {
                              if(value!.isEmpty)
                              {
                                return 'password is too short';
                              }

                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>  ForgotPassword()));
                            },
                            child: Text(
                              "Forgot Password ? ",
                              style: TextStyle(fontSize: 15, color: Theme.of(context).primaryColor),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        ConditionalBuilder(
                          condition: state is! AtmsLoginLoadingState,
                          builder: (context) => defaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                               AtmsLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            text: 'login',
                            isUpperCase: true,
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "don't have an account ? ",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>  RegisterScreen()));
                              },
                              child: Text(
                                "Sign Up ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
