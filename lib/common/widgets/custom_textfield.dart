import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomTextField(
      {super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
        fontFamily: "Quicksand",
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        fillColor: Colors.blueGrey[200],
        filled: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black38,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black38,
          )),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: "Quicksand",
          ),),
          
      validator: (val) {},
    );
  }
}
