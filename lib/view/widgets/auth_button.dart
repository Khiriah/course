import 'package:course/utills/theme.dart';
import 'package:course/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utills/theme.dart';
import '../../utills/theme.dart';

class AuthButton extends StatelessWidget {
   AuthButton({Key? key, required this.text, required this.onPressed}) : super(key: key);
final String text;
final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary:Get.isDarkMode ? mainColor:pinkClr,
        minimumSize: Size(360, 50),
      ),
      onPressed: onPressed,
      child: TextUtils(
        text: text,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        underLine: TextDecoration.none,
      ),
    );
  }
}
