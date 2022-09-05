import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:event_app/components/custom_text.dart';
import 'package:event_app/components/custome_textfield.dart';
import 'package:flutter/material.dart';

final List<String> items = [
  ' General event or Party',
  'Private event or Party',
];
String? selectedValue = items[0];

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
                  buttonWidth: double.infinity,
                  hint: selectedValue!,
                  dropdownItems: items,
                  value: selectedValue,
                  onChanged: (value) {
                    // setState(() {
                    //   selectedValue = value;
                    //   print(selectedValue);
                    //   Navigator.pop(context);
                    // });
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
