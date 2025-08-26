import 'package:flutter/material.dart';
import 'package:greenfork/src/constants/app_color.dart';
import 'package:iconly/iconly.dart';

class CommonButtonsWidget {
  Widget commonBackButton(BuildContext context) => IconButton(
    onPressed: () {
      Navigator.pop(context);
    },
    style: IconButton.styleFrom(backgroundColor: AppColor.primary[200]),
    icon: Icon(
      IconlyBold.arrow_left_circle,
      color: AppColor.primary[900],
      size: 28,
    ),
  );
}
