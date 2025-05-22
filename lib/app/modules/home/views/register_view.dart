import 'package:boking_app/app/Widget/Bottom.dart';
import 'package:boking_app/app/Widget/TextInput.dart';
import 'package:boking_app/app/data/help.dart';
import 'package:boking_app/app/modules/home/controllers/auth_controller_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final AuthControllerController authControllerController =
      AuthControllerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),

        title: const Text(
          'Register',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeHelper(context).height(15)),

              CircleAvatar(
                radius: 50,
                backgroundColor: const Color.fromARGB(255, 216, 216, 216),
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
              SizedBox(height: SizeHelper(context).height(10)),
              input(name, phone, email, password, context),
              SizedBox(height: SizeHelper(context).height(2)),
              BottomCostom(
                Controller: () {
                  if (name.text.isEmpty ||
                      phone.text.isEmpty ||
                      email.text.isEmpty ||
                      password.text.isEmpty) {
                    Get.snackbar(
                      'Error',
                      'Please fill all fields',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  } else {
                    authControllerController.register(
                      name.text,
                      phone.text,
                      email.text,
                      password.text,
                    );
                  }
                },
                label: 'Register',
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget input(name, phone, email, password, BuildContext context) {
  return Column(
    children: [
      TextinputCustom(
        hintText: "Nama Lengkap",
        obscureText: false,
        controller: name,
        color: const Color.fromARGB(255, 216, 216, 216),
      ),
      SizedBox(height: SizeHelper(context).height(2)),
      TextinputCustom(
        hintText: "Nomer Telepon",
        obscureText: false,
        controller: phone,
        color: const Color.fromARGB(255, 216, 216, 216),
      ),
      SizedBox(height: SizeHelper(context).height(2)),

      TextinputCustom(
        hintText: "Email",
        obscureText: false,
        controller: email,
        color: const Color.fromARGB(255, 216, 216, 216),
      ),
      SizedBox(height: SizeHelper(context).height(2)),

      TextinputCustom(
        hintText: "Password",
        obscureText: false,
        controller: password,
        color: const Color.fromARGB(255, 216, 216, 216),
      ),
    ],
  );
}
