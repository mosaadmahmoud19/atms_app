import 'package:atms_app/models/admin_model/attendance_model/attendance_model.dart';
import 'package:atms_app/shared/cubit/cubit.dart';
import 'package:atms_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Attendance extends StatelessWidget {

//set list here as like
//List<> listClass = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AtmsAppCubit,AtmsAppStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var cubit = AtmsAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Attendance'),
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
                              )
                            ]
                        )
                      ]),
                  SizedBox(height: 12,),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => attendItem(cubit.atmAttendanceAdminModel.attendanceToday![index]),
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: cubit.atmAttendanceAdminModel.attendanceToday!.length),
                ],
              ),
            ),
          ),
        );
      },

    );
  }
  Widget attendItem(AttendanceTodayAdminModel model) {
    return Table(children:  [
      TableRow(
          children:[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                model.userName ?? "",
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                model.userEmail ?? "",
              ),
            ),
          ]
      )
    ]);
  }
}
