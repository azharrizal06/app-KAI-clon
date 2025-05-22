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
