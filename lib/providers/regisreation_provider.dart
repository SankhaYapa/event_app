import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:event_app/components/custom_dialogBox.dart';
import 'package:event_app/controllers/auth_controller.dart';
import 'package:event_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class RegistrationProvider extends ChangeNotifier {
  bool _passwordVisible = true;
  bool _isLoging = false;

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

//get password hidden
  bool get isPasswordVisible => _passwordVisible;

//get is lording
  bool get isLording => _isLoging;

//gatters
  TextEditingController get fullNameController => _fullNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  //change passwordvisibale
  void changePasswordVistibale() {
    _passwordVisible = !_passwordVisible;
    notifyListeners();
  }

  //validater
  bool inputValidation() {
    var isValid = false;
    if (_emailController.text.isEmpty ||
        _fullNameController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      isValid = false;
    } else if (!EmailValidator.validate(_emailController.text)) {
      isValid = false;
    } else {
      isValid = true;
    }
    return isValid;
  }

  Future<void> srartRegister(BuildContext context) async {
    try {
      setLording(true);

      if (inputValidation()) {
        await AuthController()
            .registrationUser(
              context,
              _emailController.text,
              _passwordController.text,
              _fullNameController.text,
            )
            .whenComplete(() => UserProvider().fetchSingleUser(
                AuthController().userCredential2.user!.uid.toString()));
      } else {
        CustomAwesomDialog().dialogBox(
          context,
          "Error...!",
          "Please check your input details.",
          DialogType.ERROR,
        );
      }

      setLording(false);
    } catch (e) {
      setLording(false);
      Logger().e(e);
    }
  }

  //change lordingState
  void setLording([bool val = false]) {
    _isLoging = val;
    notifyListeners();
  }
}
