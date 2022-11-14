import 'package:course/logic/controller/auth_controller.dart';
import 'package:course/utills/my_string.dart';
import 'package:course/utills/theme.dart';
import 'package:course/view/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/auth_text_form_field.dart';


class ForgotPassword extends StatelessWidget {
   ForgotPassword({Key? key}) : super(key: key);
  final fromKey = GlobalKey<FormState>();
   final cotroller = Get.find<AuthController>();
   final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();

   @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        title: Text('Forgot Password',style: TextStyle(color:Get.isDarkMode ? mainColor : pinkClr,),
        ),
        leading: IconButton(
          onPressed: (){

          },
          icon:Icon(Icons.arrow_back) ,
          color:  Get.isDarkMode ? Colors.white : Colors.black,
        ),

      ),
      backgroundColor:Get.isDarkMode ? Colors.white : darkGreyClr,
      body:  Form(
        key: fromKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,),
            child:
            Column(
              children: [
                Align(alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: (){
                  Get.back();
                  },
                  icon: Icon(Icons.close_rounded,
                  color:  Colors.white ),
                ),),
                SizedBox(height: 20,),
                Text('If you want to recover your account, then please provide your email ID below..',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                color:Colors.white),
                ),
                SizedBox(height: 50,),
                Image.asset("assets/images/forgetpass copy.png",
                width: 250,),
                SizedBox(height: 50,),
                AuthTextFormField(
                  controller: emailController,
                  obscureText: false,
                  validator: (value) {
                    if (!RegExp(validationEmail).hasMatch(value)) {
                      return 'Invalid Email';
                    } else {
                      return null;
                    }
                  },
                  prefixIcon: Get.isDarkMode
                      ? Image.asset("assets/images/email.png")
                      : Icon(
                    Icons.email,
                    color: pinkClr,
                    size: 30,
                  ),
                  suffixIcon: Text(""),
                  hintText: 'Email',
                ),
                SizedBox(
                  height: 50,
                ),
                // GetBuilder<AuthController>(builder: (_) {
                //   return AuthTextFormField(
                //     controller: passwordController,
                //     obscureText: cotroller.isVisibilty ? false : true,
                //     validator: (value) {
                //       if (value.toString().length < 6) {
                //         return 'Password should be longer or equal to 6 characters';
                //       } else {
                //         return null;
                //       }
                //     },
                //     prefixIcon: Get.isDarkMode
                //         ? Image.asset("assets/images/lock.png")
                //         : Icon(
                //       Icons.person,
                //       color: pinkClr,
                //       size: 30,
                //     ),
                //     suffixIcon: IconButton(
                //       onPressed: () {
                //         cotroller.Visibilty();
                //       },
                //       icon: cotroller.isVisibilty
                //           ? Icon(Icons.visibility_off)
                //           : Icon(Icons.visibility),
                //       color: Colors.black,
                //     ),
                //     hintText: 'Password',
                //   );
                // }),
                AuthButton(text: "SEND", onPressed: (){

                })

              ],
            ),
          ),
        ),


      ),
    ),

    );
  }
}
