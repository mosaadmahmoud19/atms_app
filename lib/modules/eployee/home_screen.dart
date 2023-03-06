import 'package:atms_app/modules/eployee/req_screen.dart';
import 'package:atms_app/shared/component/component.dart';
import 'package:atms_app/shared/component/consant.dart';
import 'package:atms_app/shared/cubit/cubit.dart';
import 'package:atms_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AtmsAppCubit,AtmsAppStates>(
      listener: (context,state)
      {
           if(state is AtmsAppChekInSuccessState)
           {
                if(state.checkInModel.status)
                {
                  showToast(
                    text: state.checkInModel.message,
                    state: ToastStates.SUCCESS,
                  );
                }
                else
                {
                  showToast(
                    text: state.checkInModel.message,
                    state: ToastStates.WARNING,
                  );
                }
           }
           else
           {
             if(state is AtmsAppChekOutSuccessState)
             {
               if(state.checkOutModel.status)
               {
                 showToast(
                   text: state.checkOutModel.message,
                   state: ToastStates.SUCCESS,
                 );
               }
               else
               {
                 showToast(
                   text: state.checkOutModel.message,
                   state: ToastStates.WARNING,
                 );
               }
             }
           }
      },
      builder: (context,state)
      {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Home',style: TextStyle(
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
                      child: Text('Welcome',
                        style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 20,color: Colors.blue,),),
                    ),
                    Text('Mosaad',
                      style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20,color: Colors.blue,),),
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
                        height: 100,
                        width: 120,
                        child: ElevatedButton.icon(onPressed:()
                        {
                          AtmsAppCubit.get(context).chekInUser(uidLogin: token!);
                        },
                            icon: Icon(Icons.check),
                            label: Text('Check in')),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        height: 100,
                        width: 120,
                        child: ElevatedButton.icon(onPressed: ()
                        {
                          AtmsAppCubit.get(context).chekOutUser(uidLogin: token!);
                        },
                            icon: Icon(Icons.check), label: Text('Check out')),
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
                    height: 100,
                    width: 120,
                    child: ElevatedButton.icon(onPressed: ()
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  RequestScreen()));
                    }, icon: Icon(Icons.request_page), label: Text('Request')),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

