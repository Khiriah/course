import 'package:flutter/material.dart';

 TextUtils extends StatelessWidget {

  final String text ;
  final double fontSize;
  final FontWeight fontWeight;


   TextUtils({
     required this .text,
     required this .fontSize,
     required this .fontWeight,
     Key? key
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: fontWeight
      ),
    )
  }
}
