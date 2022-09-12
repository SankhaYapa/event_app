import 'package:event_app/components/custom_text.dart';
import 'package:event_app/components/custome_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({Key? key}) : super(key: key);

  @override
  State<AddEvent> createState() => _AddEventState();
}

DateTime? selectedDate;
DateTime? selectedSTime;
DateTime? selectedETime;

class _AddEventState extends State<AddEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 8),
          width: MediaQuery.of(context).size.width - 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: CustomText(
                  text: "Add Event",
                  fontSize: 25,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  CustomText(text: "Event Date : "),
                  (selectedDate == null)
                      ? IconButton(
                          onPressed: () async {
                            final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2015, 8),
                                lastDate: DateTime(2101));
                            if (picked != null && picked != selectedDate) {
                              setState(() {
                                selectedDate = picked;
                              });
                            }
                          },
                          icon: Icon(
                            Icons.date_range_outlined,
                          ),
                        )
                      : GestureDetector(
                          onTap: () async {
                            final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2015, 8),
                                lastDate: DateTime(2101));
                            if (picked != null && picked != selectedDate) {
                              setState(() {
                                selectedDate = picked;
                              });
                            }
                          },
                          child: CustomText(
                            text:
                                "${selectedDate!.year.toString()} / ${selectedDate!.month.toString()} / ${selectedDate!.day.toString()}",
                          ),
                        ),
                ],
              ),

              Row(
                children: [
                  CustomText(text: "Start Time : "),
                  (selectedDate == null)
                      ? IconButton(
                          onPressed: () async {
                            final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2015, 8),
                                lastDate: DateTime(2101));
                            if (picked != null && picked != selectedDate) {
                              setState(() {
                                selectedDate = picked;
                              });
                            }
                          },
                          icon: Icon(
                            Icons.date_range_outlined,
                          ),
                        )
                      : GestureDetector(
                          onTap: () async {
                            final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2015, 8),
                                lastDate: DateTime(2101));
                            if (picked != null && picked != selectedDate) {
                              setState(() {
                                selectedDate = picked;
                              });
                            }
                          },
                          child: CustomText(
                            text:
                                "${selectedDate!.year.toString()} / ${selectedDate!.month.toString()} / ${selectedDate!.day.toString()}",
                          ),
                        ),
                ],
              ),

              Row(
                children: [
                  CustomText(text: "End Time : "),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.date_range_outlined,
                    ),
                  )
                ],
              ),
              // DatePickerDialog(
              //   initialDate: DateTime.now(),
              //   firstDate: DateTime(2021),
              //   lastDate: DateTime(2024),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
