import 'package:atms_app/models/admin_model/admin/department_model.dart';
import 'package:atms_app/shared/component/component.dart';
import 'package:atms_app/shared/component/consant.dart';
import 'package:atms_app/shared/cubit/cubit.dart';
import 'package:atms_app/shared/cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DepartmentScreen extends StatelessWidget {
  var scaffoldtwo = const GlobalObjectKey<ScaffoldState>(AppBar);
  var namedepController = TextEditingController();
  var emailheadController = TextEditingController();
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AtmsAppCubit,AtmsAppStates>(
      listener: (context,state)
      {
        // if(state is AtmsNewAddDepartmentSuccessState)
        // {
        //   if(state.atmAddNewDepartmentAdminModel.status)
        //   {
        //     Navigator.pop(context);
        //   }
        // }

      },
      builder: (context,state)
      {
        var cubit = AtmsAppCubit.get(context);
        return Scaffold(
          key: scaffoldtwo,
          appBar: AppBar(
            centerTitle: true,
            title: Text('Departments'),
            actions: [
              IconButton(
                  onPressed: ()
                  {
                    scaffoldtwo.currentState?.showBottomSheet((context) => Container(
                      height: 300,
                      child: Padding(
                        padding:EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: SingleChildScrollView(
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                defaultFormField(
                                  controller: namedepController,
                                  type: TextInputType.text,
                                  validate: (String? value)
                                  {
                                    if(value!.isEmpty)
                                    {
                                      return ' department must not be empty';
                                    }
                                  },
                                  label: ' Enter Department Name',
                                  prefix: Icons.edit,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                defaultFormField(
                                  controller: emailheadController,
                                  type: TextInputType.emailAddress,
                                  validate: (String? value)
                                  {
                                    if(value!.isEmpty)
                                    {
                                      return 'email  not be empty';
                                    }
                                  },
                                  label: 'Enter email address',
                                  prefix: Icons.person_add,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ConditionalBuilder(
                                  condition: state is! AtmsNewAddDepartmentLoadingState,
                                  builder: (context) => defaultButton(

                                    function: () {
                                      if (formKey.currentState!.validate())
                                      {

                                       AtmsAppCubit.get(context).addNewDepartment(
                                           departmentName: namedepController.text,
                                           email: emailheadController.text,
                                           uidAdd: token!,
                                       );
                                      }

                                    },
                                    text: 'Add',
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
                    ));
                  },
                  icon: Icon(Icons.add))
            ],
          ),
          body: Container(
            // color: Colors.black87,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Table(
                      defaultColumnWidth: FixedColumnWidth(100),
                      children:  [
                        TableRow(children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Department',
                              style:
                              TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'email',
                              style:
                              TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Delete',
                              style:
                              TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'edit',
                              style:
                              TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                          )
                        ])
                      ]),
                   SizedBox(
                    height: 12,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => departItem(cubit.atmDepartmentAdminModel.data![index],context),
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: cubit.atmDepartmentAdminModel.data!.length),
                ],
              ),
            ),
          ),
        );
      },

    );
  }

  Widget departItem(DepartmentAdminDataModel model ,context) {
    return Table(children: [
      TableRow(children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            model.departmentName ?? "",
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            model.The_Head?.email ?? "",
          ),
        ),
        IconButton(
            onPressed:()
        {
          AtmsAppCubit.get(context).deleteDepartment(
            departmentName: namedepController.text,
            uidDelete: token!,
          );
        },
            icon: Icon(
                Icons.delete,
            )
        ),
        IconButton(onPressed: ()
        {
          showDialog(
              context: context,
              builder: (context)=>AlertDialog(
                content: Container(
                  height: 100,

                  child: Column(
                    children: [
                      TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                            hintText: 'Enter Department'
                        ),
                        controller: namedepController,
                      ),
                      TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                            hintText: 'Enter Email'
                        ),
                        controller: emailheadController,
                      ),
                    ],
                  ),
                ),
                actions: [
                  Row(
                    children: [
                      TextButton(
                          onPressed:()
                          {
                            AtmsAppCubit.get(context).updateDepartment(
                                departmentName: namedepController.text,
                                email: emailheadController.text,
                                uidUpdate: token!,
                            );
                          },
                          child: Text('OK')),
                      TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text('Cancle')),
                    ],
                  )
                ],
              ));
        },
            icon: Icon(Icons.edit))
      ])
    ]);
  }



  // void submit() {
  //   if (namedepController.text.isEmpty ||
  //       emailheadController.text.isEmpty) {
  //     return;
  //   }
  //   //here you can send data
  //   Navigator.of(context).pop();
  //   setState(() {
  //     namedepController.clear();
  //     emailheadController.clear();
  //   });
  //
  // }
}




