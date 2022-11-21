import 'package:course/utills/theme.dart';
import 'package:course/view/widgets/home/card_item.dart';
import 'package:course/view/widgets/home/search_from_text.dart';
import 'package:course/utills/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: Get.isDarkMode ? pinkClr : mainColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child:  Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child:Column(
                  crossAxisAlignment:CrossAxisAlignment.start ,
                  children: [
                    TextUtils(
                        text: "Find Your",
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        underLine: TextDecoration.none),
                    SizedBox(height: 5,),
                    TextUtils(
                        text: "INSPIRATION",
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        underLine: TextDecoration.none),
                    SizedBox(height: 20,),
                    SearchFormText(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextUtils(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  text: "Categories",
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CardItems(),
          ],
        ),
      ),
    );
  }
}