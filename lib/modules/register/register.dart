import 'package:atms_app/modules/login/login.dart';
import 'package:atms_app/modules/register/cubit/cubit.dart';
import 'package:atms_app/modules/register/cubit/states.dart';
import 'package:atms_app/shared/component/component.dart';
import 'package:atms_app/shared/component/consant.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget  {

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AtmsRegisterCubit(),
      child: BlocConsumer<AtmsRegisterCubit,AtmsRegisterStates>(
        listener: (context,state)
        {
          if (state is AtmsRegisterSuccessState)
          {
            if (state.atmsRegisterModel.status)
            {
              showToast(
                text: state.atmsRegisterModel.message,
                state: ToastStates.SUCCESS,
              );
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  LoginScreen()));
            }
            else
            {
              showToast(
                text: state.atmsRegisterModel.message,
                state: ToastStates.WARNING,
              );
            }
          }
        },
        builder: (context ,state)
        {
          return  SafeArea(
            child:Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Register Here",
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        Image.asset(
                          "assets/register.jpg",
                          height: 250,
                          width: double.infinity,
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        defaultFormField(
                            controller: firstNameController,
                            type: TextInputType.text,
                            validate: (String? value)
                            {
                              if(value!.isEmpty)
                              {
                                return 'first name not be empty';
                              }
                            },
                            label: 'First Name',
                            prefix: Icons.person,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                          controller: lastNameController,
                          type: TextInputType.text,
                          validate: (String? value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'last name not be empty';
                            }
                          },
                          label: 'Last Name',
                          prefix: Icons.person_add,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String? value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'email not be empty';
                            }
                          },
                          label: 'Email',
                          prefix: Icons.email,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          suffix: AtmsRegisterCubit.get(context).suffix,
                          onSubmit: (value)
                          {

                          },
                          isPassword: AtmsRegisterCubit.get(context).isPassword,
                          suffixPressed: () {
                            AtmsRegisterCubit.get(context)
                                .changePasswordVisibility();
                          },
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'password is too short';
                            }
                          },
                          label: 'Password',
                          prefix: Icons.lock_outline,
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        ConditionalBuilder(
                          condition: state is! AtmsRegisterLoadingState,
                          builder: (context) => defaultButton(
                            function: () {
                              if (formKey.currentState!.validate())
                              {
                                AtmsRegisterCubit.get(context).userRegister(
                                 firstName:firstNameController.text,
                                  lastName: lastNameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,

                                );
                                print(firstNameController.text);
                                print(lastNameController.text);
                                print(emailController.text);
                              }
                            },
                            text: 'sign up',
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
                              "already have an account ? ",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: Colors.grey),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                               MaterialPageRoute(
                                        builder: (context) => const LoginScreen()));
                              },
                              child: Text(
                                "Sign In ",
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
            ),);
        },
      ),
    );
  }
}


