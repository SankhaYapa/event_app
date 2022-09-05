import 'package:event_app/components/custom_icon.dart';
import 'package:event_app/components/custom_text.dart';
import 'package:event_app/components/custome_textfield.dart';
import 'package:event_app/screens/friend_profile.dart';
import 'package:event_app/utils/util_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff5669FF),
        title: Center(child: Text('Friends List')),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                preffix: Icon(Icons.search),
              ),
              SizedBox(
                height: 20,
              ),
              CustomFriendTile(
                onTap: () {
                  UtilFunction.navigateTo(context, FriendProfileScreen());
                },
                Text: 'Alex Lee',
                Follower: "2k Followers",
              ),
              SizedBox(
                height: 20,
              ),
              CustomFriendTile(
                onTap: () {
                  UtilFunction.navigateTo(context, FriendProfileScreen());
                },
                Text: 'Alex Lee',
                Follower: "2k Followers",
              ),
              SizedBox(
                height: 20,
              ),
              CustomFriendTile(
                onTap: () {
                  UtilFunction.navigateTo(context, FriendProfileScreen());
                },
                Text: 'Alex Lee',
                Follower: "2k Followers",
              ),
              SizedBox(
                height: 20,
              ),
              CustomFriendTile(
                onTap: () {
                  UtilFunction.navigateTo(context, FriendProfileScreen());
                },
                Text: 'Alex Lee',
                Follower: "2k Followers",
              ),
              SizedBox(
                height: 20,
              ),
              CustomFriendTile(
                onTap: () {
                  UtilFunction.navigateTo(context, FriendProfileScreen());
                },
                Text: 'Alex Lee',
                Follower: "2k Followers",
              ),
              SizedBox(
                height: 20,
              ),
              CustomFriendTile(
                onTap: () {
                  UtilFunction.navigateTo(context, FriendProfileScreen());
                },
                Text: 'Alex Lee',
                Follower: "2k Followers",
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomFriendTile extends StatelessWidget {
  CustomFriendTile({
    required this.Text,
    required this.Follower,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  String Text;
  String Follower;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            Icons.account_circle,
            size: 45,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: Text,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              CustomText(
                text: Follower,
                color: Color(0xff747688),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }
}
