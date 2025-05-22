import 'package:flutter/material.dart';

class BottomCostom extends StatelessWidget {
  Function Controller;
  final String? label;
  // color
  final Color? color;
  BottomCostom({Key? key, required this.Controller, this.color, this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Controller();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Colors.blue,
        minimumSize: const Size(double.infinity, 50),
        padding: const EdgeInsets.symmetric(vertical: 16),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Text(
        '$label',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
