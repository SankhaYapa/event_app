import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:event_app/components/custom_dialogBox.dart';
import 'package:event_app/controllers/db_controller.dart';
import 'package:event_app/screens/main_screens/main_screen.dart';
import 'package:event_app/utils/util_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthController {
  //firebase auth instance created
  FirebaseAuth auth = FirebaseAuth.instance;
  late UserCredential userCredential2;

  //user registration function
  Future<void> registrationUser(
    BuildContext context,
    String _email,
    String _password,
    String _fullName,
  ) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      print("object1");
      if (userCredential.user!.uid.isNotEmpty) {
        print("object2");
        await DatabaseController().saveUserDate(
          _fullName,
          _email,
          _password,
          userCredential.user!.uid,
        );
        print("object3");
      }
      userCredential2 = userCredential;

      CustomAwesomDialog().dialogBox(
          context,
          "Success...!",
          "Congratulations...! User Account created Now you can Login.",
          DialogType.SUCCES);

      Future.delayed(Duration(seconds: 5), () {
        UtilFunction.pushRemoveNavigation(context, const MainScreen());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        CustomAwesomDialog().dialogBox(
            context,
            'Error...!',
            "The password provided is too weak..............",
            DialogType.ERROR);
      } else if (e.code == 'email-already-in-use') {
        CustomAwesomDialog().dialogBox(context, "Error...!",
            "The account already exists for that email.", DialogType.ERROR);
      }
    } catch (e) {
      print(e);
    }
  }

  //user login function
  Future<void> login(
      BuildContext context, String _email, String _password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      if (userCredential.user != null) {
        UtilFunction.navigateTo(context, MainScreen());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CustomAwesomDialog().dialogBox(context, "Error...!",
            'No user found for that email.', DialogType.ERROR);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        CustomAwesomDialog().dialogBox(context, "Error...!",
            'Wrong password provided for that user.', DialogType.ERROR);
      }
    }
  }

  //send password reset email function
  Future<void>? sendPasswordResetemail(
      BuildContext context, String _email) async {
    try {
      await auth.sendPasswordResetEmail(email: _email);
      CustomAwesomDialog().dialogBox(context, "Success...!",
          "please check your email address.", DialogType.SUCCES);
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        CustomAwesomDialog().dialogBox(context, "Invalid Email...!",
            'please enter valid email.', DialogType.ERROR);
      } else {
        CustomAwesomDialog()
            .dialogBox(context, "Error...!", e.toString(), DialogType.ERROR);
      }
    } catch (e) {
      CustomAwesomDialog()
          .dialogBox(context, "Error...!", e.toString(), DialogType.ERROR);
    }
  }
}
