import 'package:course/logic/controller/auth_controller.dart';
import 'package:course/routes/app_routes.dart';
import 'package:course/utills/theme.dart';
import 'package:course/view/widgets/container_under.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../utills/my_string.dart';
import '../../widgets/auth_button.dart';
import '../../widgets/auth_text_form_field.dart';
import '../../widgets/check_widget.dart';
import '../../widgets/text_utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final cotroller = Get.find<AuthController>();

  final fromKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          elevation: 0,
        ),
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                    padding: EdgeInsets.only(left: 25, right: 25, top: 40),
                    child: Form(
                      child: Column(
                        key: fromKey,
                        children: [
                          Row(
                            children: [
                              TextUtils(
                                text: "LOG",
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Get.isDarkMode ? mainColor : pinkClr,
                                underLine: TextDecoration.none,
                              ),
                              TextUtils(
                                text: "IN",
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Get.isDarkMode
                                    ? Colors.black
                                    : Colors.white,
                                underLine: TextDecoration.none,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            height: 20,
                          ),
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
                            height: 20,
                          ),
                          GetBuilder<AuthController>(builder: (_) {
                            return AuthTextFormField(
                              controller: passwordController,
                              obscureText: cotroller.isVisibilty ? false : true,
                              validator: (value) {
                                if (value.toString().length < 6) {
                                  return 'Password should be longer or equal to 6 characters';
                                } else {
                                  return null;
                                }
                              },
                              prefixIcon: Get.isDarkMode
                                  ? Image.asset("assets/images/lock.png")
                                  : Icon(
                                      Icons.person,
                                      color: pinkClr,
                                      size: 30,
                                    ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  cotroller.Visibilty();
                                },
                                icon: cotroller.isVisibilty
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                                color: Colors.black,
                              ),
                              hintText: 'Password',
                            );
                          }),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Get.toNamed(Routes.forgotPasswordScreen);
                              },
                              child: TextUtils(
                                text: 'Forgot Password ?',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Get.isDarkMode
                                    ? Colors.black
                                    : Colors.white,
                                underLine: TextDecoration.underline,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          CheckWidget(),
                          SizedBox(
                            height: 50,
                          ),
                          AuthButton(
                            text: 'LOG IN',
                            onPressed: () {},
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextUtils(
                            text: "OR",
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Get.isDarkMode ? Colors.black : Colors.white,
                            underLine: TextDecoration.none,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {},
                                child:
                                    Image.asset("assets/images/facebook.png"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                  onTap: () {},
                                  child:
                                      Image.asset("assets/images/google.png")),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          ContainerUnder(
                            text: "Dont't have Account ?",
                            onPressed: () {
                              Get.offNamed(Routes.signUpScreen);
                            },
                            textType: 'Sign up ',
                          ),
                        ],
                      ),
                    )))
          ],
        )));
  }
}
