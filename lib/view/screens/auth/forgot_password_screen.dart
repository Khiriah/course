import 'package:course/logic/controller/auth_controller.dart';
import 'package:course/utills/my_string.dart';
import 'package:course/utills/theme.dart';
import 'package:course/view/widgets/auth_button.dart';
import 'package:course/view/widgets/auth_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          centerTitle:  true,
          elevation: 0,
          title: Text(
              'forget password',
              style: TextStyle(
                color: Get.isDarkMode ? mainColor : pinkClr,
              )
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back),
            color: Get.isDarkMode ? Colors.white : darkGreyClr,
          ),
        ),
        // backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Align(
                  alignment:  Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'if you want to recorve your account,then please provide your email Id below..',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const  SizedBox(
                  height:50,
                ),
                Image.asset('assets/images/forgetpass copy.png',
                  width: 350,
                ),
                const  SizedBox(
                  height:50,
                ),
                AuthTextFormField(
                  controller: emailController,
                  obscureText: false,
                  validator: (value) {
                    if (!RegExp(validationEmail).hasMatch(value)) {
                      return 'Invalid email';
                    } else {
                      return null;
                    }
                  },
                  prefixIcone: Get.isDarkMode
                      ? Image.asset(
                      'assets/images/forgetpass copy.png')
                      : Icon(
                    Icons.email_rounded,
                    color: pinkClr,
                    size: 20,
                  ),
                  suffixIcone: const Text(""),
                  hintText: "Email",
                ),
                const  SizedBox(
                  height:30,
                ),
                GetBuilder<AuthController>(builder: (_){
                  return AuthButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()){
                        String email = emailController.text.trim();
                        controller.resetPassword(email);
                      }
                    },
                    text: "SEND",
                  );
                }),
                // AuthButtone(
                //   onPressed: () {},
                //   text: "SEND",
                // ),
              ],
            ),
          ),
        ),
      ),

    );

  }
}
