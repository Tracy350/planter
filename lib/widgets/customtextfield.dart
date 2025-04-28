import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;

  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      ),
    );
  }
}
