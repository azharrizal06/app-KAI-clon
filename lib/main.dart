import 'package:boking_app/app/modules/home/views/home_view.dart';
import 'package:boking_app/app/modules/home/views/login_view.dart';
import 'package:boking_app/app/modules/home/views/register_view.dart';
import 'package:boking_app/app/views/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashView(),
    );
  }
}
