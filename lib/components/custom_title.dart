import 'package:event_app/components/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: CustomText(
        text: text,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
