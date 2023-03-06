import 'package:atms_app/shared/bloc_observer.dart';
import 'package:atms_app/shared/component/consant.dart';
import 'package:atms_app/shared/cubit/cubit.dart';
import 'package:atms_app/shared/network/local/cache_helper.dart';
import 'package:atms_app/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'modules/login/login.dart';

void main() async
{


  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  token = CacheHelper.getData(key: 'token');

  print(token);

  //eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MzkzM2U2NTM2OWJmMGQwYTMwYWMxMTkiLCJyb2xlIjoiMSIsIm5hbWUiOiJheW1hbiAgYWxpIiwiaWF0IjoxNjcwNjg3MDM2fQ.UCnmd5Ga9qa5GUjYiodUdWPbxWGrpbVsWWnO5-vUy2c

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(
          create: (BuildContext context) => AtmsAppCubit()
            ..getDepartments(token: token!)
            ..getUserAttendance()
            ..getEmployee(token: token!)
            ..getHead(token: token!)


        ),
      ],
      child: MaterialApp(
        title: 'Login UI',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xff4C53FB),

        ),
        home: const LoginScreen(),
      ),
    );
  }
}