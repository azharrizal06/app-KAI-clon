import 'package:flutter/material.dart';

class TextinputCustom extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final Color color;

  const TextinputCustom({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
