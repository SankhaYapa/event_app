import 'dart:io';

import 'package:event_app/model/user_model.dart';
import 'package:event_app/screens/auth_screens/login_screen.dart';
import 'package:event_app/utils/util_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

import '../controllers/db_controller.dart';
import '../screens/main_screens/main_screen.dart';

class UserProvider extends ChangeNotifier {
  final DatabaseController _databaseController = DatabaseController();

  final _fNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  //gatters
  TextEditingController get fNameController => _fNameController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get emailController => _emailController;

  late UserModel _userModel;
  UserModel get userModel => _userModel;

  final ImagePicker _picker = ImagePicker();

  //image file
  File _image = File("");

  //get image
  File get getImg => _image;

  String userName = "User";

  void setControllers() {
    loding = false;
    _fNameController.text = _userModel.fullName;
    _emailController.text = _userModel.email;
  }

  //initialize user function
  Future<void> initializerUser(BuildContext context) async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        Logger().w('User is currently signed out');
        UtilFunction.navigateTo(context, SignInPage());
      } else {
        Logger().w('User is signed in');
        print(user.email);
        print(user.uid);

        await fetchSingleUser(user.uid);
        UtilFunction.navigateTo(context, MainScreen());
        Logger().i(_userModel.fullName);
      }
    });
  }

  Future<void> fetchSingleUser(String id) async {
    _userModel = (await _databaseController.getUserData(id))!;

    notifyListeners();
  }

//select image
  Future<void> selectImage() async {
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        notifyListeners();
      } else {
        Logger().i("No image selected");
      }
    } catch (e) {
      Logger().e(e);
    }
  }

  //sign out method
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    UtilFunction.navigateTo(context, SignInPage());
  }

  bool loding = false;
  Future<void> updateUser(BuildContext context) async {
    loding = true;
    try {
      _databaseController.updateUser(
        _userModel.uid,
        _fNameController.text,
        _emailController.text,
        _image,
        _userModel,
      );

      notifyListeners();
    } catch (e) {}
  }

  void setImage(String a, UserModel model) {
    model.img = a;
    // model.fname = _fNameController.text;
    // model.lname = _lNameController.text;
    // model.email = _emailController.text;
    // model.occupation = _occupationController.text;
    // model.status = _statusController.text;
    loding = false;
    notifyListeners();
  }
}
