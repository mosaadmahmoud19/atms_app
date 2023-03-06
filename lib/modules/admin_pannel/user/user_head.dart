import 'package:atms_app/models/admin_model/users_model/head_model.dart';
import 'package:atms_app/shared/cubit/cubit.dart';
import 'package:atms_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'comp_head.dart';

class UserHead extends StatelessWidget {

  var scaffoldone= GlobalObjectKey<ScaffoldState>(AppBar);
  TextEditingController nameofheadController = TextEditingController();
  TextEditingController emailofheadController = TextEditingController();
  TextEditingController roleController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AtmsAppCubit,AtmsAppStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var cubit = AtmsAppCubit.get(context);
        return Scaffold(
          key: scaffoldone,
          appBar: AppBar(
            centerTitle: true,
            title: Text('Heads'),
            actions: [
              // IconButton(onPressed: (){
              //   scaffoldone.currentState?.showBottomSheet((context) =>Container(
              //     height: 400,
              //     child: Column(
              //       children: [
              //         Container(
              //           color: Colors.black12,
              //           padding: EdgeInsets.all(15),
              //           child: TextField(
              //             controller: nameofheadController,
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
              //             controller: emailofheadController,
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
              //             controller: roleController,
              //             decoration: InputDecoration(
              //                 hintText: 'Enter The role',
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
              //             // if(nameofheadController.text.isEmpty||emailofheadController.text.isEmpty||
              //             //     roleController.text.isEmpty){
              //             //   return ;
              //             // }
              //             // listComps.add(Comp(
              //             //     nameofhead: nameofheadController.text,
              //             //     emailofhead: emailofheadController.text,
              //             //     role: roleController.text
              //             //
              //             // ));
              //             // nameofheadController.text ="";
              //             // emailofheadController.text = "";
              //             // roleController.text = "";
              //             // print(listComps.length);
              //             // // setState(
              //             // //       () {
              //             // //     nameofheadController.clear();
              //             // //     emailofheadController.clear();
              //             // //     roleController.clear();
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
                      children: const [
                        TableRow(
                            children:[

                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text('User',style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
                              ),

                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text('Email',style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
                              ),

                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text('Role',style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
                              ),

                            ]
                        )
                      ]),
                  SizedBox(height: 12,),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>headItem(cubit.atmHeadsAdminModel.users![index]),
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: cubit.atmHeadsAdminModel.users!.length),
                ],
              ),
            ),
          ),
        );
      }

    );
  }
  Widget headItem(HeadAdminHeadModel modal) {
    return Table(children: [
      TableRow(
          children:[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(modal.fristName ?? ""),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(modal.email ?? ""),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(modal.role ?? ""),
            ),


          ]
      )
    ]);
  }

}

