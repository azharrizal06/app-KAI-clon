import 'dart:convert';

import 'package:boking_app/app/data/Domain.dart';
import 'package:boking_app/app/data/serviseAuth.dart';
import 'package:boking_app/app/modules/home/views/home_view.dart';
import 'package:boking_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class HomeController extends GetxController {
  void checkLoginStatus() async {
    Logger().i("checkLoginStatus");
    await Future.delayed(Duration(seconds: 2)); // simulasi delay splash
    bool isLogin = await AuthService.isLoggedIn();
    if (isLogin) {
      Get.offAll(HomeView()); // ganti dengan route kamu
    } else {
      Get.offAllNamed(Routes.LOGIN); // ganti dengan route login kamu
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
