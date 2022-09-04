import 'package:event_app/components/custom_button.dart';
import 'package:event_app/components/custom_icon.dart';
import 'package:event_app/components/custom_text.dart';
import 'package:event_app/components/custome_textfield.dart';
import 'package:event_app/providers/login_provider.dart';
import 'package:event_app/providers/user_provider.dart';
import 'package:event_app/screens/auth_screens/forgotpassword_screen.dart';
import 'package:event_app/screens/auth_screens/registration_screen.dart';
import 'package:event_app/screens/main_screens/main_screen.dart';
import 'package:event_app/utils/util_function.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Consumer<LoginProvider>(
        builder: (context, value, child) => Container(
          padding: const EdgeInsets.symmetric(vertical: 33, horizontal: 13),
          // height: UtilFunction.windoSize(context).height,
          // width: UtilFunctions.windoSize(context).width,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              SizedBox(
                height: 50,
                width: 250,
                child: CustomIcon(iconName: "logo.png"),
              ),
              SizedBox(
                height: 30,
              ),
              CustomText(
                text: "Sign In",
                fontSize: 24,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                preffix: Icon(Icons.email_outlined),
                controller: value.emailController,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: TextField(
                  controller: value.passwordController,
                  obscureText: isObscure,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: IconButton(
                        onPressed: () {
                          setState(() {});
                          isObscure = false;
                        },
                        icon: Icon(isObscure ? Icons.lock : Icons.lock),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 36, 34, 34))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                  //isLoading: true,
                  onTap: () async {
                    value.startLogin(context);
                    //UtilFunction.navigateTo(context, MainScreen());
                  },
                  text: 'SIGN IN'),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Center(
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                          text: 'Register',
                          style: TextStyle(
                              color: Color.fromARGB(255, 58, 51, 247),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              UtilFunction.navigateTo(context, RegisterPage());
                            }),
                    ])),
                  ),
                  GestureDetector(
                      onTap: () {
                        UtilFunction.navigateTo(context, ForgotPasswordPage());
                      },
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                            color: Color.fromARGB(255, 58, 51, 247),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ))
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
