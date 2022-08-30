import 'package:event_app/components/custom_button.dart';
import 'package:event_app/components/custom_icon.dart';
import 'package:event_app/components/custom_text.dart';
import 'package:event_app/components/custome_textfield.dart';
import 'package:event_app/utils/util_function.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RESET PASSWORD'),
        backgroundColor: Color(0xff5669FF),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 33, horizontal: 13),
          // height: UtilFunction.windoSize(context).height,
          // width: UtilFunctions.windoSize(context).width,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  text:
                      'Please enter your email address\n to request a password reset'),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                preffix: Icon(Icons.email_outlined),
                hintText: 'abc@email.com',
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                  //isLoading: true,
                  onTap: () async {
                    // value.startLogin(context);
                  },
                  text: 'RESET PASSWORD'),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
