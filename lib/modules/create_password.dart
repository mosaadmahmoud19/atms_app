import 'package:atms_app/modules/login/login.dart';
import 'package:atms_app/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CreatePassword extends StatefulWidget {
  const CreatePassword({Key? key}) : super(key: key);

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  @override
  Widget build(BuildContext context) {
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    bool isPassword = true;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          elevation: 0,
          titleSpacing: 0.0,
          leading: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  FeatherIcons.arrowLeft,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ],
          ),
          title:InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              "Back",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(
                FeatherIcons.helpCircle,
                color: Colors.black,
                size: 25,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Create New Password",
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Your password must be diffrent from previous used passwords",
                  style: TextStyle(fontSize: 13, color: Colors.black),
                ),
                SizedBox(
                  height: 20,
                ),

                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
                  child: defaultFormField(
                    onSubmit: (value)
                    {
                      print(value);
                    },
                    controller: passwordController,
                    label: 'Password',
                    prefix: Icons.lock,
                    suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                    isPassword: isPassword,
                    suffixPressed: ()
                    {
                      setState(()
                      {
                        isPassword = !isPassword;
                      });
                    },
                    type: TextInputType.visiblePassword,
                    validate: (String value)
                    {
                      if(value.isEmpty)
                      {
                        return 'password is too short';
                      }

                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
                  child: defaultFormField(
                    onSubmit: (value)
                    {
                      print(value);
                    },
                    controller: confirmPasswordController,
                    label: ' Confirm Password',
                    prefix: Icons.lock,
                    suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                    isPassword: isPassword,
                    suffixPressed: ()
                    {
                      setState(()
                      {
                        isPassword = !isPassword;
                      });
                    },
                    type: TextInputType.visiblePassword,
                    validate: (String value)
                    {
                      if(value.isEmpty)
                      {
                        return 'password is too short';
                      }

                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  color: Theme.of(context).primaryColor,
                  height: 45,
                  minWidth: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Theme.of(context).primaryColor)),
                  child: Text(
                    "Reset Password ",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()));
                  },
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}