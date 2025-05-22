import 'package:boking_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SplashView extends GetView {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    homeController.checkLoginStatus();
    return Scaffold(
      appBar: AppBar(title: const Text('SplashView'), centerTitle: true),
      body: const Center(
        child: Text('SplashView is working', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
