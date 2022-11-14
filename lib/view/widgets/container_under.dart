import 'package:course/utills/theme.dart';
import 'package:course/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerUnder extends StatelessWidget {
   ContainerUnder({Key? key, required this.text, required this.onPressed, required this.textType}) : super(key: key);
final String text;
   final String textType;
   final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? mainColor:pinkClr,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
              text: text,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              underLine: TextDecoration.none),
          TextButton(
              onPressed: onPressed,
              child: TextUtils(
                  text: textType,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  underLine: TextDecoration.underline),)
        ],
      ),
    );
  }
}
