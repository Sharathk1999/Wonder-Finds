import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String btnName;
  final VoidCallback onPressed;
  const CustomButton({
    super.key,
    required this.btnName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueGrey,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )
      ),
      child: Text(
        btnName,
        style: const TextStyle(
          fontFamily: "Quicksand",
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
