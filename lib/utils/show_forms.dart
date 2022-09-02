import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:event_app/components/custom_text.dart';
import 'package:event_app/components/custome_textfield.dart';
import 'package:flutter/material.dart';

class ShowForms {
  static void showForm(
    BuildContext context,
  ) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        context: context,
        builder: (context) {
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
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 70,
                      ),
                    ],
                  )));
        });
  }
}
