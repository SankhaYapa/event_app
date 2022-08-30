import 'package:event_app/components/custom_button.dart';
import 'package:event_app/screens/auth_screens/forgotpassword_screen.dart';
import 'package:event_app/utils/app_colors.dart';
import 'package:event_app/utils/util_function.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.cyan,
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
                child: Column(
              children: [
                Text(
                  'Account Details',
                  style: TextStyle(
                      fontSize: 25, color: kwhite, fontWeight: FontWeight.w500),
                ),
                Icon(
                  Icons.account_circle,
                  size: 100,
                  color: kwhite,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "abc@email.com",
                  style: TextStyle(
                      fontSize: 18, color: kwhite, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sankha",
                      style: TextStyle(
                          fontSize: 18,
                          color: kwhite,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Sankha",
                      style: TextStyle(
                          fontSize: 18,
                          color: kwhite,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(
                  height: 150,
                ),
                CustomButton(
                    onTap: () {
                      UtilFunction.navigateTo(context, ForgotPasswordPage());
                    },
                    text: 'Change Paswords'),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                    onTap: () {
                      // Provider.of<UserProvider>(context, listen: false)
                      //     .logout(context);
                    },
                    text: 'Logout'),
                SizedBox(
                  height: 20,
                ),
                CustomButton(onTap: () {}, text: 'App Version 1.0.1'),
              ],
            ))
          ],
        ));
  }
}
