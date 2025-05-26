import 'dart:convert';

import 'package:boking_app/app/data/Domain.dart';
import 'package:boking_app/app/data/serviseAuth.dart';
import 'package:boking_app/app/modules/home/Model/usermodel,dart';
import 'package:boking_app/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthControllerController extends GetxController {
  //TODO: Implement AuthControllerController

  Future login(phone, password) async {
    var response = await http.post(
      Uri.parse(Domain.login),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      // Convert the phone and password to JSON
      body: jsonEncode({"phone": phone, "password": password}),
    );

    // Handle the response

    if (response.statusCode == 200) {
      // Login successful
      var data = jsonDecode(response.body);

      AuthService.saveLoginData(
        data['token'],
        UserModel.fromJson(data['user']),
      );
      Logger().i(data);
      Get.offAll(HomeView());
    } else {
      // Login failed
      var data = jsonDecode(response.body);
      Logger().e(data);
      // Show an error message to the user
      Get.snackbar(
        'Login Failed',
        data['message'],
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  //register
  Future register(name, phone, email, password) async {
    var response = await http.post(
      Uri.parse(Domain.register),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      // Convert the phone and password to JSON
      body: jsonEncode({
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
      }),
    );

    // Handle the response

    if (response.statusCode == 201) {
      // Login successful
      var data = jsonDecode(response.body);
      Logger().i(data);
      Get.offAll(HomeView());
    } else {
      // Login failed
      var data = jsonDecode(response.body);
      Logger().e(data);
      // Show an error message to the user
      Get.snackbar(
        'Login Failed',
        data['message'],
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  final count = 0.obs;
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

  void increment() => count.value++;
}
