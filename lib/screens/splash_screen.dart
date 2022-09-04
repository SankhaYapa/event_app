import 'package:event_app/providers/user_provider.dart';
import 'package:event_app/screens/auth_screens/login_screen.dart';
import 'package:event_app/utils/constant.dart';
import 'package:event_app/utils/util_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Provider.of<UserProvider>(context, listen: false)
          .initializerUser(context);
    });
  }
  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(const Duration(seconds: 5), () {
  //     UtilFunctions.pushRemoveNavigator(context, const SignInPage());
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Image.asset(Constants.iconAssets('logo.png')),
        ),
      ),
    );
  }
}
