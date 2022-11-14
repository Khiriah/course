import 'package:course/logic/controller/auth_controller.dart';
import 'package:course/utills/theme.dart';
import 'package:course/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CheckWidget extends StatelessWidget {
   CheckWidget({Key? key}) : super(key: key);
final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {

    return GetBuilder<AuthController>(builder: (_){
      return Row(
        children: [
          InkWell(
              onTap: () {
              controller.checBox();
              },
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:

                controller.isCheckBox ?
                Get.isDarkMode ?  Image.asset("assets/images/check.png"):
                Icon(Icons.done,
               size: 30,color: pinkClr)
                    :
                    Container(),


                ),
              ),
          SizedBox(
            width: 10,
          ),
          Row(
            children: [
              TextUtils(
                  text: "I accept",
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                  underLine: TextDecoration.none),
              TextUtils(
                  text: "terms & conditions",
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                  underLine: TextDecoration.underline),
            ],
          )
        ],
      );
    });
  }
}
