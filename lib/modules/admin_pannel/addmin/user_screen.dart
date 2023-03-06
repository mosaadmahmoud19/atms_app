import 'package:atms_app/modules/admin_pannel/user/set_department.dart';
import 'package:atms_app/modules/admin_pannel/user/set_role.dart';
import 'package:atms_app/modules/admin_pannel/user/user_employee.dart';
import 'package:atms_app/modules/admin_pannel/user/user_head.dart';
import 'package:atms_app/shared/cubit/cubit.dart';
import 'package:atms_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AtmsAppCubit,AtmsAppStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('User',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

          ),
          body: Container(
            color: Colors.lightBlue,
            child: Center(
              child: Column(
                children: [
                  Spacer(),
                  Row(
                    children:
                    [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          height: 120,
                          width: 150,
                          child: ElevatedButton.icon(onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserEmployee()));
                          }, icon: Icon(Icons.person), label: Text('Employees')),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          height: 120,
                          width: 150,
                          child: ElevatedButton.icon(onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserHead()));
                          }, icon: Icon(Icons.person), label: Text('Heads')),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          height: 120,
                          width: 150,
                          child: ElevatedButton.icon(onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SetRole()));
                          }, icon: Icon(Icons.add), label: Text('Set Role')),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          height: 120,
                          width: 150,
                          child: ElevatedButton.icon(onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SetDepartment()));
                          }, icon: Icon(Icons.add), label: Text('Set Department')),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        );
      }

    );
  }
}
