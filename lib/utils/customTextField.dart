import 'package:flutter/material.dart';

import '../Models/formcontroller.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.formcontroller,
      required this.labelText,
      required this.controller,
      required this.icon,
      this.keyType});

  final FormController formcontroller;
  final String labelText;
  final controller;
  final IconData icon;
  final keyType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 15,
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyType,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black)
          ),
          prefixIcon: Icon(icon, color: Colors.black),
        ),
      ),
    );
  }
}
