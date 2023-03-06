import 'package:atms_app/shared/component/component.dart';
import 'package:atms_app/shared/component/consant.dart';
import 'package:atms_app/shared/cubit/cubit.dart';
import 'package:atms_app/shared/cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestScreen extends StatelessWidget {


  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var leaveRequestController = TextEditingController();
  var formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AtmsAppCubit,AtmsAppStates>(
    listener: (context,state)
    {
      if (state is AtmsRequestSuccessState)
      {
        if (state.atmsRequestModel.status)
        {
          showToast(
            text: state.atmsRequestModel.message,
            state: ToastStates.SUCCESS,
          );
        }
        else
        {
          showToast(
            text: state.atmsRequestModel.message,
            state: ToastStates.ERROR,
          );
        }
      }
    },
      builder: (context,state)
      {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Request',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    children: [
                      defaultFormField(
                        controller: nameController,
                        type: TextInputType.text,
                        validate: (String? value)
                        {
                          if(value!.isEmpty)
                          {
                            return 'first name not be empty';
                          }
                        },
                        label: 'Name',
                        prefix: Icons.person,
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
                        controller: leaveRequestController,
                        type: TextInputType.text,
                        validate: (String? value)
                        {
                          if(value!.isEmpty)
                          {
                            return 'request must not be empty';
                          }
                        },
                        label: 'Request',
                        prefix: Icons.request_page_rounded,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ConditionalBuilder(
                        condition:  state is! AtmsRequestLoadingState,
                        builder: (context) => defaultButton(
                          function: () {
                            if (formKey.currentState!.validate())
                            {
                             AtmsAppCubit.get(context).userRequest(
                                 name: nameController.text,
                                 email: emailController.text,
                                 reason: leaveRequestController.text,
                                 uidRequest: token!,
                             );

                              print(leaveRequestController.text);
                            }
                          },
                          text: 'Send Request',
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
//    Container(
//                 child: TextField(
//                   controller: reqController,
//                   decoration: InputDecoration(
//                     contentPadding: EdgeInsets.all(12),
//                     hintText: 'Enter the Request',
//                     hintStyle: TextStyle(
//                       color: Colors.grey,
//                     ),
//                     fillColor: Colors.black12,
//                     suffixIcon: Icon(
//                       Icons.drive_file_rename_outline,
//                       color: Colors.black12,
//                     ),
//                   ),
//
//                 ),
//               ),