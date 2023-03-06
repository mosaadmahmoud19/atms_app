import 'package:atms_app/models/admin_model/users_model/employee_model.dart';
import 'package:atms_app/modules/admin_pannel/user/comp_employee.dart';
import 'package:atms_app/shared/cubit/cubit.dart';
import 'package:atms_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserEmployee extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameofdepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AtmsAppCubit,AtmsAppStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var cubit = AtmsAppCubit.get(context);
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            centerTitle: true,
            title: Text('Employees'),
            actions: [
              // IconButton(onPressed: (){
              //   scaffoldKey.currentState?.showBottomSheet((context) =>Container(
              //     height: 400,
              //     child: Column(
              //       children: [
              //         Container(
              //           color: Colors.black12,
              //           padding: EdgeInsets.all(15),
              //           child: TextField(
              //             controller: nameController,
              //             decoration: InputDecoration(
              //                 hintText: 'Enter The name',
              //                 hintStyle: TextStyle(
              //                   color: Colors.black,
              //                 ),
              //                 fillColor: Colors.black12,
              //                 suffixIcon: Icon(
              //                   Icons.drive_file_rename_outline,
              //                   color: Colors.black12,
              //                 )),
              //           ),
              //         ),
              //         Spacer(),
              //         Container(
              //           color: Colors.black12,
              //           padding: EdgeInsets.all(15),
              //           child: TextField(
              //             controller: emailController,
              //             decoration: InputDecoration(
              //                 hintText: 'Enter email',
              //                 hintStyle: TextStyle(
              //                   color: Colors.black,
              //                 ),
              //                 fillColor: Colors.black12,
              //                 suffixIcon: Icon(
              //                   Icons.drive_file_rename_outline,
              //                   color: Colors.black12,
              //                 )),
              //           ),
              //         ),
              //         Spacer(),
              //         Container(
              //           color: Colors.black12,
              //           padding: EdgeInsets.all(15),
              //           child: TextField(
              //             controller: nameofdepController,
              //             decoration: InputDecoration(
              //                 hintText: 'Enter The department',
              //                 hintStyle: TextStyle(
              //                   color: Colors.black,
              //                 ),
              //                 fillColor: Colors.black12,
              //                 suffixIcon: Icon(
              //                   Icons.drive_file_rename_outline,
              //                   color: Colors.black12,
              //                 )),
              //           ),
              //         ),
              //         Spacer(),
              //         ElevatedButton(
              //           onPressed: () {
              //             // if(nameController.text.isEmpty||emailController.text.isEmpty||
              //             //     nameofdepController.text.isEmpty){
              //             //   return ;
              //             // }
              //             // listEmployee.add(Employee(
              //             //     name: nameController.text,
              //             //     email: emailController.text,
              //             //     nameofdep: nameofdepController.text
              //             //
              //             // ));
              //             // nameController.text ="";
              //             // emailController.text = "";
              //             // nameofdepController.text = "";
              //             //
              //             //
              //             //
              //             // print(listEmployee.length);
              //             // // setState(
              //             // //       () {
              //             // //     nameController.clear();
              //             // //     emailController.clear();
              //             // //     nameofdepController.clear();
              //             // //
              //             // //   },
              //             // // );
              //           },
              //           child: Container(
              //             padding: EdgeInsets.all(15),
              //             child: Text(
              //               'Add',
              //               style: TextStyle(color: Colors.black),
              //             ),
              //           ),
              //           style: ButtonStyle(
              //               backgroundColor:
              //               MaterialStateProperty.all(Colors.blue),
              //               shape: MaterialStateProperty.all(
              //                 RoundedRectangleBorder(
              //                   borderRadius:
              //                   BorderRadius.circular(30),
              //                 ),
              //               )),
              //         ),
              //         Spacer(),
              //       ],
              //     ),
              //   ) );
              //
              // }, icon: Icon(Icons.add))
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
                        TableRow(
                            children:[

                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text('User',style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
                              ),

                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text('email',style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
                              ),

                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text('Department',style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
                              ),

                            ]
                        )
                      ]),
                  SizedBox(height: 12,),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => compItem(cubit.atmEmployeeAdminModel.users![index]),
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: cubit.atmEmployeeAdminModel.users!.length),
                ],
              ),
            ),
          ),
        );
      }
    );

  }
  Widget compItem(EmployeeAdminDataModel model) {
    return Table(children: [
      TableRow(
          children:[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(model.fristName ?? ""),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(model.email ?? ""),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(model.department_name ?? ""),
            ),


          ]
      )
    ]);
  }


}


