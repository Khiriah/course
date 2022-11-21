import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final Function validator;
  final Widget prefixIcone;
  final Widget suffixIcone;
  final String hintText;

  const AuthTextFormField(
      {required this.controller,
        required this.obscureText,
        required this.validator,
        required this.prefixIcone,
        required this.suffixIcone,
        required this.hintText,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        obscureText: obscureText,
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        validator: (value) => validator(value),
        decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          prefixIcon: prefixIcone,
          suffixIcon: suffixIcone,
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}
