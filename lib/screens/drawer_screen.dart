import 'package:event_app/components/custom_button.dart';
import 'package:event_app/providers/user_provider.dart';
import 'package:event_app/screens/auth_screens/forgotpassword_screen.dart';
import 'package:event_app/utils/app_colors.dart';
import 'package:event_app/utils/util_function.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Consumer<UserProvider>(
      builder: (context, value, child) => ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.account_circle,
                  size: 100,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Ashfak Sayem",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 48,
                ),
                CustomList(
                  icon: Icon(Icons.person_outline),
                  text: 'My Profile',
                ),
                SizedBox(
                  height: 33,
                ),
                CustomList(
                  icon: Icon(Icons.message_outlined),
                  text: 'Massage',
                ),
                SizedBox(
                  height: 33,
                ),
                CustomList(
                  icon: Icon(Icons.calendar_today_outlined),
                  text: 'Calender',
                ),
                SizedBox(
                  height: 33,
                ),
                CustomList(
                  icon: Icon(Icons.bookmark_outline),
                  text: 'Bookmark',
                ),
                SizedBox(
                  height: 33,
                ),
                CustomList(
                  icon: Icon(Icons.mail_outline),
                  text: 'Contact Us',
                ),
                SizedBox(
                  height: 33,
                ),
                CustomList(
                  icon: Icon(Icons.settings_outlined),
                  text: 'Settings',
                ),
                SizedBox(
                  height: 33,
                ),
                CustomList(
                  icon: Icon(Icons.help_outline_outlined),
                  text: 'Helps & FAQs',
                ),
                SizedBox(
                  height: 33,
                ),
                GestureDetector(
                  onTap: () {
                    value.logout(context);
                  },
                  child: CustomList(
                    icon: Icon(Icons.logout),
                    text: 'Sign Out',
                  ),
                ),
                SizedBox(
                  height: 33,
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class CustomList extends StatelessWidget {
  CustomList({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);
  String text;
  Icon icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
