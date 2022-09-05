import 'package:event_app/components/custom_icon.dart';
import 'package:event_app/components/custom_images.dart';
import 'package:event_app/components/custom_text.dart';
import 'package:event_app/model/event_model.dart';
import 'package:event_app/screens/event_details.dart';
import 'package:event_app/utils/app_colors.dart';
import 'package:event_app/utils/util_function.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    Key? key,
    required this.model,
    required this.imageLink,
  }) : super(key: key);
  //
  final EventModel? model;
  final String imageLink;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        UtilFunction.navigateTo(
            context,
            EventDetails(
              model: model,
              imageLink: imageLink,
            ));
      },
      child: SizedBox(
        height: 120,
        width: double.infinity,
        child: Card(
          elevation: 5,
          color: Colors.white,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: CustomNetworkImage(
                  fit: BoxFit.fill,
                  height: 100,
                  width: 100,
                  url: imageLink,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Wed, Apr 28.530 PM",
                      color: Colors.blue,
                    ),
                    SizedBox(
                        height: 45,
                        width: size.width - 150,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Jo Malone London’s Mother’s Day Presents",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: size.width - 180,
                          child: CustomText(
                            text: "Radius Gallery • Santa Cruz, CA",
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          // trailing: SizedBox(
          //   width: double.infinity,
          //   child: Column(
          //     children: [],
          //   ),
          // ),
        ),
      ),
    );
  }
}
