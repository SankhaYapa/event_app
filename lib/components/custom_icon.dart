import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    Key? key,
    required this.iconName,
    this.color,
  }) : super(key: key);

  final String iconName;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/icons/$iconName",
      fit: BoxFit.cover,
      color: color,
    );
  }
}
