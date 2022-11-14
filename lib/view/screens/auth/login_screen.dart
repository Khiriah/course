import 'package:course/logic/controller/auth_controller.dart';
import 'package:course/routes/app_routes.dart';
import 'package:course/utills/my_string.dart';
import 'package:course/utills/theme.dart';
import 'package:course/view/widgets/auth_button.dart';
import 'package:course/view/widgets/auth_text_form_field.dart';
import 'package:course/view/widgets/check_widget.dart';
import 'package:course/view/widgets/container_under.dart';
import 'package:course/view/widgets/text_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final fromKey = GlobalKey<FormState>(); // هنا نتحقق من الفالديشن انها صحيحة
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //final controller = Get.put(AuthController()); // اول ماافتح التطبيق يتم استدعائها
  final controller =
  Get.find<AuthController>(); // ت

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        elevation: 0,
      ),
      //backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
      body: SingleChildScrollView(
        child: Form(
          key: fromKey,
          child: Column(
            children: [
              SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                                fontSize: 23,
                                fontWeight: FontWeight.w500,
                                text: "LOG",
                                color: Get.isDarkMode ? mainColor : pinkClr,
                                underLine: TextDecoration.none),
                            const SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                                fontSize: 23,
                                fontWeight: FontWeight.w500,
                                text: "IN",
                                color: Get.isDarkMode
                                    ? Colors.black
                                    : pinkClr,
                                underLine: TextDecoration.none),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const SizedBox(
                          height: 20,
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
                              '/Users/hananasiri/Desktop/hanan-shop/assets/images/email.png')
                              : Icon(
                            Icons.email_rounded,
                            color: pinkClr,
                            size: 30,
                          ),
                          suffixIcone: const Text(""),
                          hintText: "Email",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AuthTextFormField(
                              controller: passwordController,
                              obscureText: controller.isVisibilty ? false : true,// هنا اظهرنا الباسوورد في علامة العين
                              validator: (value) {
                                if (value.toString().length < 6) {
                                  return 'password should be longer or equal to 6 charactors';
                                } else {
                                  return null;
                                }
                              },
                              prefixIcone: Get.isDarkMode
                                  ? Image.asset(
                                  '/Users/hananasiri/Desktop/hanan-shop/assets/images/lock.png')
                                  : Icon(
                                Icons.lock,
                                color: pinkClr,
                                size: 30,
                              ),
                              hintText: "Password",
                              suffixIcone: IconButton(
                                onPressed: () {
                                  controller.visibilty();
                                },
                                icon: controller.isVisibilty
                                    ? const Icon(
                                  Icons.visibility_off,
                                  color: Colors.black,
                                )
                                    : const Icon(
                                  Icons.visibility,
                                  color: Colors.black,
                                ),
                              ),
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.forgotPasswordScreen);
                            },
                            child: TextUtils(
                              text: "forget password?",
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color:
                              Get.isDarkMode ? Colors.white : Colors.black,
                              underLine:  TextDecoration.none,
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 50,
                        ),
                        GetBuilder<AuthController>(builder: (_){
                          return AuthButton(
                            onPressed: () {
                              if(fromKey.currentState!.validate()) {
                                String email = emailController.text.trim();
                                String password = passwordController.text;
                                controller.loginUpUsingFirebade(email: email, password: password);
                              }
                            },
                            text: "LOG IN",
                          );
                        }),
                        // AuthButtone(
                        //   onPressed: () {},
                        //   text: "LOG IN",
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                        TextUtils(
                          text: "OR",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color:
                          Get.isDarkMode ? Colors.black : Colors.white,
                          underLine:  TextDecoration.none,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell( // عشان اذا ضغطت ع الصورة تنضغط معي يصير لها اون تاب
                              onTap: () {},
                              child:
                              Image.asset('assets/images/facebook.png',
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            GetBuilder<AuthController>(builder: (_){
                              return
                                InkWell(
                                    onTap: () {
                                      controller.googleSignUpApp();
                                    },
                                    child:
                                    Image.asset('assets/images/google.png'));
                            })
                            // InkWell(
                            //     onTap: () {},
                            //     child:
                            //     Image.asset('/Users/hananasiri/Desktop/shop-app-flutter/assets/images/google.png')),
                          ],
                        )
                      ],
                    ),
                  )),
              ContainerUnder(
                text: "Don't have an Account?",
                textType: 'Sign up',
                // underLine: TextDecoration.underline,
                onPressed: () {
                  Get.offNamed(Routes.signUpScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
