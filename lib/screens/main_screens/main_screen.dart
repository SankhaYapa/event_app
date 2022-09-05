import 'package:animate_do/animate_do.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:event_app/components/custom_icon.dart';
import 'package:event_app/components/custom_images.dart';
import 'package:event_app/components/custom_svg.dart';
import 'package:event_app/components/custom_text.dart';
import 'package:event_app/components/custome_textfield.dart';
import 'package:event_app/screens/friendslist_screen.dart';
import 'package:event_app/screens/general_party_screen.dart';
import 'package:event_app/screens/privateparty_screen.dart';
import 'package:event_app/screens/drawer_screen.dart';
import 'package:event_app/screens/profile_screen.dart';
import 'package:event_app/utils/app_colors.dart';
import 'package:event_app/utils/show_forms.dart';
import 'package:event_app/utils/util_function.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const GeneralPartyPage(),
    const PrivatePartyScreen(),
    const FriendsScreen(),
    const ProfileScreen()
  ];
  Future<bool> initBackButton() async {
    return await showDialog(
          context: context,
          builder: (context) => ElasticIn(
              child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
              10,
            )),
            title: const CustomText(
              text: "ExitApp",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            content: Builder(
              builder: (context) {
                return const SizedBox(
                  height: 70,
                  width: 200,
                  child: CustomText(text: "Do you really want to exit an app?"),
                );
              },
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                onPressed: () => Navigator.of(context).pop(true),
                child: const CustomText(
                  text: "Yes",
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                child: const CustomText(
                  text: "No",
                ),
              ),
            ],
          )),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: initBackButton,
      child: Scaffold(
        body: _screens.elementAt(_currentIndex),
        bottomNavigationBar: Container(
          height: 70,
          color: Colors.white,
          child: Column(
            children: [
              const Divider(height: 1, color: grayColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomNavTile(
                    text: "General",
                    icon: "party.png",
                    isSelected: _currentIndex == 0,
                    ontap: () {
                      setState(() {
                        _currentIndex = 0;
                      });
                    },
                  ),
                  BottomNavTile(
                    text: "Privat",
                    icon: "event.png",
                    isSelected: _currentIndex == 1,
                    ontap: () {
                      setState(() {
                        _currentIndex = 1;
                      });
                    },
                  ),
                  FloatingActionButton(
                      backgroundColor: Color(0xff5669FF),
                      child: Icon(Icons.add),
                      onPressed: () {
                        ShowForms.showForm(context);
                      }),
                  BottomNavTile(
                    text: "Friends",
                    icon: "friends.png",
                    isSelected: _currentIndex == 2,
                    ontap: () {
                      setState(() {
                        _currentIndex = 2;
                      });
                    },
                  ),
                  BottomNavTile(
                    text: "Account",
                    icon: "profilee.png",
                    isSelected: _currentIndex == 3,
                    ontap: () {
                      setState(() {
                        _currentIndex = 3;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (context) {
        List<bool> _selections = List.generate(3, (_) => false);
        return Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                CustomText(
                  text: "Add Event",
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomDropdownButton2(
                  hint: selectedValue!,
                  dropdownItems: items,
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                      print(selectedValue);
                      Navigator.pop(context);
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class BottomNavTile extends StatelessWidget {
  const BottomNavTile({
    Key? key,
    required this.icon,
    required this.isSelected,
    required this.ontap,
    this.padding = 10,
    required this.text,
  }) : super(key: key);

  final String icon;
  final bool isSelected;
  final Function() ontap;
  final double padding;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ontap,
        child: Container(
          padding: EdgeInsets.all(padding),
          width: 75,
          height: 65,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
                width: 20,
                child: CustomIcon(
                  iconName: icon,
                  color: isSelected ? kpurple : grayColor,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              CustomText(
                text: text,
                fontSize: 11,
                color: isSelected ? kpurple : grayColor,
              ),
            ],
          ),
        ));
  }
}
