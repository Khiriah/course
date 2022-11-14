

import 'package:course/routes/app_routes.dart';
import 'package:course/utills/theme.dart';
import 'package:course/view/screens/auth/login_screen.dart';
import 'package:course/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';



class WelcomeScreen extends StatelessWidget {

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [

              SizedBox(
                width:double.infinity ,// العرض كامل
                height: double.infinity ,// الطول كامل
                child: Image.asset("assets/images/background.png",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width:double.infinity ,// العرض كامل
                height: double.infinity ,// الطول كامل
                color: Colors.black.withOpacity(0.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 100,),
                    Container(
                      height:60 ,
                      width: 190,
                      decoration: BoxDecoration(
                        color:Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child : TextUtils(
                          text: "welcome", fontSize: 35, fontWeight: FontWeight.bold,color: Colors.white,
                          underLine: TextDecoration.none,
                        ),
                      ),

                    ),
                    SizedBox(height: 10,),
                    Container(
                        height:60 ,
                        width: 230,
                        decoration: BoxDecoration(
                          color:Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment:MainAxisAlignment.center ,
                          children: [
                            TextUtils(
                              text: "Khairo", fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color:mainColor,
                              underLine: TextDecoration.none,
                            ),
                            SizedBox(width: 7,),
                            TextUtils(
                              text: "Shop", fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color:Colors.white,
                              underLine: TextDecoration.none,
                            ),

                            SizedBox(width: 7,),
                          ],
                        )
                    ),
                    SizedBox(height: 250,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 12
                        ),
                      ),
                      onPressed: (){
                        Get.offNamed(Routes.loginScreen);
                      }
                      , child:
                    TextUtils(
                      text: "Get Start", fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color:Colors.white,
                      underLine: TextDecoration.none,
                    ),

                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextUtils(
                          text: "Don't have an Account?", fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color:Colors.white,
                          underLine: TextDecoration.none,
                        ),
                        TextButton(onPressed: (){
                          Get.offNamed(Routes.signUpScreen);
                        }, child: TextUtils(
                          text: "Sigun up", fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color:Colors.white,
                          underLine: TextDecoration.underline,

                        ), )
                      ],
                    )
                  ],
                ),

              )
            ],
          ),
        )
    );
  }
}
