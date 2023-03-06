import 'package:atms_app/modules/create_password.dart';
import 'package:atms_app/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();
    var formKey = GlobalKey<FormState>();


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
          title:  InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              "Back",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
              ),
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20.0,),
              child: Icon(
                FeatherIcons.helpCircle,
                color: Colors.black,
                size: 25,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20,),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Reset password",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Enter the email associated with your account we will send you and email with instruction to reset your password",
                    style: TextStyle(fontSize: 15, color: Colors.black,),
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
                         BorderRadius.all(Radius.circular(10))),
                    child:  defaultFormField(
                      onSubmit: (value)
                      {
                        print(value);
                      },
                      controller: emailController,
                      label: 'Email Address',
                      prefix: Icons.email,
                      type: TextInputType.emailAddress,
                      validate: (String value)
                      {
                        if(value.isEmpty)
                        {
                          return 'email must not be empty';
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
                      "Send Instruction",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  CreatePassword()));
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
      ),
    );
  }
}