import 'package:event_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Custom_loader extends StatelessWidget {
  const Custom_loader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitDoubleBounce(
      color: kgreen,
      size: 40,
    );
  }
}
