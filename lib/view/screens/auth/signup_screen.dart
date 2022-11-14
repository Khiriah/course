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


class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final fromKey = GlobalKey<FormState>(); // هنا نتحقق من الفالديشن انها صحيحة
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //final controller = Get.put(AuthController()); // اول ماافتح التطبيق يتم استدعائها
  final controller =
  Get.find<AuthController>(); // تبع الباسوورد هل هو مرئي او لا

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        elevation: 0,
      ),
      backgroundColor: context.theme.backgroundColor,
      // backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
      body: SingleChildScrollView(
        child: Form(
          key: fromKey,
          child: Column(
            children: [
              SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: Padding(
                    padding: EdgeInsets.only(left: 25, right: 25, top: 40),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                                fontSize: 23,
                                fontWeight: FontWeight.w500,
                                text: "SIGN",
                                color: Get.isDarkMode ? mainColor : pinkClr,
                                underLine: TextDecoration.none),
                            const SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                                fontSize: 23,
                                fontWeight: FontWeight.w500,
                                text: "UP",
                                color: Get.isDarkMode
                                    ? Colors.black
                                    : Colors.black,
                                underLine: TextDecoration.none),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        AuthTextFormField(
                          controller: nameController,
                          obscureText: false,
                          validator: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return 'Enter valid name';
                            } else {
                              return null;
                            }
                          },
                          prefixIcone: Get.isDarkMode
                              ? Image.asset(
                              '/Users/hananasiri/Desktop/hanan-shop/assets/images/user.png')
                              : Icon(
                            Icons.person,
                            color: pinkClr,
                            size: 30,
                          ),
                          suffixIcone: const Text(""),
                          hintText: "user name",
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
                              obscureText: controller.isVisibilty
                                  ? false
                                  : true, // هنا اظهرنا الباسوورد في علامة العين
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
                        SizedBox(
                          height: 50,
                        ),
                        CheckWidget(),
                        SizedBox(
                          height: 50,
                        ),

                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AuthButton(
                              onPressed: () {
                                if (controller.isCheckBox == false) {
                                  Get.snackbar(
                                    "Check Box",
                                    "please accept terms & conditions ",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.green,
                                    colorText: Colors.black,
                                  );
                                } else if (fromKey.currentState!.validate()) {
                                  String name = nameController.text.trim();
                                  String email = emailController.text.trim();
                                  String password = passwordController.text;
                                  controller.signUpUsingFirebade(
                                      name: name,
                                      email: email,
                                      password: password);
                                }
                                controller.isCheckBox = true;
                              },
                              text: "Sign up",
                            );
                          },
                        )
                        // AuthButtone(
                        //   onPressed: () async {
                        //     try {
                        //       final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        //         email: "hanann@gmail.com",
                        //         password: "Aa12345@@",
                        //       );
                        //     } on FirebaseAuthException catch (e) {
                        //       if (e.code == 'weak-password') {
                        //         print('The password provided is too weak.');
                        //       } else if (e.code == 'email-already-in-use') {
                        //         print('The account already exists for that email.');
                        //       }
                        //     } catch (e) {
                        //       print(e);
                        //     }
                        //   },
                        //   text: "Sign Up",
                        // ),
                      ],
                    ),
                  )),
              ContainerUnder(
                text: 'Already have an Account?',
                textType: 'Log in',
                // underLine: TextDecoration.underline,
                onPressed: () {
                  Get.offNamed(Routes.loginScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
