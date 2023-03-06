import 'package:atms_app/shared/component/component.dart';
import 'package:atms_app/shared/component/consant.dart';
import 'package:atms_app/shared/cubit/cubit.dart';
import 'package:atms_app/shared/cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SetDepartment extends StatelessWidget {

  var emailController = TextEditingController();
  var departmentController = TextEditingController();
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AtmsAppCubit,AtmsAppStates>(
      listener: (context,state)
      {

        if (state is AtmsSetDepartmentSuccessState)
        {
          if (state.atmsSetDepartmentAdminModel.status)
          {
            showToast(
              text: state.atmsSetDepartmentAdminModel.message,
              state: ToastStates.SUCCESS,
            );
          }
          else
          {
            showToast(
              text: state.atmsSetDepartmentAdminModel.message,
              state: ToastStates.WARNING,
            );
          }
        }

      },
      builder: (context,state)
      {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Set Department',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          ),
          body: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                       Padding(
                        padding: EdgeInsets.all(12.0),
                        child: defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String? value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'email not be empty';
                            }
                          },
                          label: 'Email Address ',
                          prefix: Icons.email,
                        ),
                      ),
                      SizedBox(height: 15,),
                       Padding(
                        padding: EdgeInsets.all(12.0),
                        child:  defaultFormField(
                          controller: departmentController,
                          type: TextInputType.text,
                          validate: (String? value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'department not be empty';
                            }
                          },
                          label: 'Department',
                          prefix: Icons.chat_bubble,
                        ),
                      ),
                      SizedBox(height: 15,),
                      ConditionalBuilder(
                        condition: state is! AtmsSetRoleLoadingState,
                        builder: (context) => defaultButton(
                          function: () {
                            if (formKey.currentState!.validate())
                            {

                              AtmsAppCubit.get(context).sendSetDepartment(
                                departmentName: departmentController.text,
                                email: emailController.text,
                                token: token!,
                              );


                            }
                          },
                          text: 'Send ',
                          isUpperCase: true,
                        ),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },

    );
  }
}
