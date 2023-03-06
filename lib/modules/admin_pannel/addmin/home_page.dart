import 'package:atms_app/modules/admin_pannel/addmin/attendance.dart';
import 'package:atms_app/modules/admin_pannel/addmin/dep_screen.dart';
import 'package:atms_app/modules/admin_pannel/addmin/user_screen.dart';
import 'package:atms_app/shared/cubit/cubit.dart';
import 'package:atms_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {


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
            title: Text(
              'Admin',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),),
          ),
          body:Container(
            color: Colors.lightBlue,
            child: Column(
              children: [
                SizedBox(height: 30,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        'Welcome',
                        style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 20,color: Colors.blue,),),
                    ),

                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserScreen()));
                        }, icon: Icon(Icons.verified_user), label: Text('User')),
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DepartmentScreen()));
                        }, icon: Icon(Icons.local_fire_department), label: Text('Departments')),
                      ),
                    ),
                  ],
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Attendance()));
                    }, icon: Icon(Icons.online_prediction), label: Text('Attendance')),
                  ),
                ),
              ],
            ),
          ),
        );
      }

    );
  }
}
