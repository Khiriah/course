import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
body: Stack(
children: [
  SizedBox(
    width:double.infinity ,// العرض كامل
    height: double.infinity ,// الطول كامل
    child: Image.asset("assets/images/background.png",
    fit: BoxFit.cover,),
  ),
  Container(
    width:double.infinity ,// العرض كامل
    height: double.infinity ,// الطول كامل
    color: Colors.black.withOpacity(0.2),
    child: Column(
      children: [
        Container(
          height:60 ,
          width: 190,
          decoration: BoxDecoration(
            color: Colors.black.opacity(0.3),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child : TextUtils(
                text: ,
          )
          )],
    ),
  )

],

),


    ));
  }
}
