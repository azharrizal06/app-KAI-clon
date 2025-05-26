import 'package:flutter/material.dart';

extension SizeHelper on BuildContext {
  /// Mendapatkan tinggi layar
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Mendapatkan lebar layar
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Mendapatkan tinggi berdasarkan persen
  double height(double percent) => screenHeight * (percent / 100);

  /// Mendapatkan lebar berdasarkan persen
  double width(double percent) => screenWidth * (percent / 100);
}

// warna
const Color primaryColor = Color(0xff0C5CA6);
const Color green = Color(0xff009D06);
const Color secondaryColor = Color(0xffF2F2F2);
const Color whiteColor = Color(0xffFFFFFF);
const Color blackColor = Color(0xff000000);
const Color greyColor = Color(0xffB7B7B7);
