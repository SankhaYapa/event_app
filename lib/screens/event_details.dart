import 'package:event_app/components/custom_images.dart';
import 'package:event_app/components/custom_text.dart';
import 'package:event_app/model/event_model.dart';
import 'package:event_app/utils/util_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class EventDetails extends StatefulWidget {
  EventDetails({
    Key? key,
    required this.model,
  }) : super(key: key);

  EventModel? model;

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 3,
                  child: CustomNetworkImage(
                      fit: BoxFit.fill,
                      url:
                          "https://topnotchtalent.com/wp-content/uploads/holiday-party-entertainment-top-notch-talent.jpg"),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CustomText(
                          text: "Event Details",
                          color: Colors.white,
                          fontSize: 30,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height / 3 - 40),
                  child: Align(
                    alignment: Alignment.center,
                    child: Card(
                      elevation: 7,
                      child: Container(
                        width: 300,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        )),
      ),
    );
  }
}
