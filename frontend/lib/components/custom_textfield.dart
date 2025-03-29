import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.validator,
      this.isPassword = false});
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validator(value),
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        focusColor: Colors.white,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: const OutlineInputBorder(),
        labelText: hintText,
        labelStyle: const TextStyle(color: Colors.amber),
        floatingLabelStyle: const TextStyle(
          fontSize: 20,
          color: Colors.amber,
        ),
      ),
    );
  }
}
