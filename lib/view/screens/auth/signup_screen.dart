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

class SignUpScreen extends StatelessWidget {
   SignUpScreen({Key? key}) : super(key: key);

 final cotroller = Get.find<AuthController>();

   
   
   final fromKey= GlobalKey<FormState>();

final TextEditingController nameController = TextEditingController();
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
key:fromKey ,
                        children: [
                          Row(
                            children: [
                          TextUtils(
                            text: "SIGN",
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Get.isDarkMode ? mainColor: pinkClr,
                            underLine: TextDecoration.none,
                          ),
                          SizedBox(width: 3,),
                          TextUtils(
                            text: "UP",
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Get.isDarkMode ? Colors.black : Colors.white,
                            underLine: TextDecoration.none,
                          ),
                        ],
                      ) ,
                        SizedBox(height: 50,),
                          AuthTextFormField(
                            controller: nameController,
                            obscureText: false,
                            validator:(value){
                              if(value.toString().length<= 2 || !RegExp(validationName).hasMatch(value)){
                                return 'Enter valid name';
                              }else{
                                return null;
                              }
                                },
                            prefixIcon: Get.isDarkMode ?
                            Image.asset("assets/images/user.png")
                                :
                            Icon(Icons.person,color: pinkClr,
                            size: 30,),
                            suffixIcon:Text(""),
                            hintText: 'User Name',
                          ),
                          SizedBox(height: 20,),
                          AuthTextFormField(
                            controller: emailController,
                            obscureText: false,
                            validator:(value){
                              if(!RegExp(validationEmail).hasMatch(value)){
                                return 'Invalid Email';
                              }else{
                                return null;
                              }
                            },
                            prefixIcon:Get.isDarkMode ?
                            Image.asset("assets/images/email.png")
                                :
                            Icon(Icons.email,color: pinkClr,
                            size: 30,),
                            suffixIcon:Text(""),
                            hintText: 'Email',
                          ),
                          SizedBox(height: 20,),
                          GetBuilder<AuthController>(
                              builder: (_){
                            return AuthTextFormField(
                              controller: passwordController,
                              obscureText: cotroller.isVisibilty  ? false:true,
                              validator:(value){
                                if(value.toString().length<6){
                                  return 'Password should be longer or equal to 6 characters';
                                }else{
                                  return null;
                                }
                              },
                              prefixIcon:Get.isDarkMode ? Image.asset("assets/images/lock.png"):
                              Icon(Icons.person,color: pinkClr,
                                size: 30,),
                              suffixIcon:IconButton(onPressed: () {
                                cotroller.Visibilty();
                              },

                                icon:cotroller.isVisibilty ? Icon(Icons.visibility_off) :
                                Icon(Icons.visibility),
                                color: Colors.black,),
                              hintText: 'Password',

                            );

                          }),
                          SizedBox(height: 50,),
                          CheckWidget(),
                          SizedBox(height: 50,),
                          AuthButton(text: 'SIGN UP', onPressed: () {  },),
                          SizedBox(height: 50,),
                          ContainerUnder(text: "Already have an Account?", onPressed: (){
                            Get.offNamed(Routes.loginScreen);
                            }, textType: 'Log in',),

                        ],
                      ),
                    )))
          ],
        )));
  }
}
