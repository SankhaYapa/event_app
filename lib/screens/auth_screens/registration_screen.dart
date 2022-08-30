import 'package:event_app/components/custom_button.dart';
import 'package:event_app/components/custom_icon.dart';
import 'package:event_app/components/custom_text.dart';
import 'package:event_app/components/custome_textfield.dart';
import 'package:event_app/utils/util_function.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SIGN UP'),
        backgroundColor: Color(0xff5669FF),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 33, horizontal: 13),
          // height: UtilFunction.windoSize(context).height,
          // width: UtilFunctions.windoSize(context).width,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                preffix: Icon(Icons.person_outline),
                hintText: 'Full name',
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                preffix: Icon(Icons.email_outlined),
                hintText: 'abc@email.com',
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: TextField(
                  //  controller: value.passwordController,

                  obscureText: isObscure,
                  decoration: InputDecoration(
                      hintText: 'Your password',
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: IconButton(
                        onPressed: () {
                          setState(() {});
                          isObscure = false;
                        },
                        icon:
                            Icon(isObscure ? Icons.lock_outlined : Icons.lock),
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
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: TextField(
                  //  controller: value.passwordController,
                  obscureText: isObscure,
                  decoration: InputDecoration(
                      hintText: 'Confirm password',
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: IconButton(
                        onPressed: () {
                          setState(() {});
                          isObscure = false;
                        },
                        icon:
                            Icon(isObscure ? Icons.lock_outlined : Icons.lock),
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
                    // value.startLogin(context);
                  },
                  text: 'SIGN IN'),
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
