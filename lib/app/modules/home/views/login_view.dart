import 'package:boking_app/app/Widget/Bottom.dart';
import 'package:boking_app/app/Widget/TextInput.dart';
import 'package:boking_app/app/data/help.dart';
import 'package:boking_app/app/modules/home/controllers/auth_controller_controller.dart';
import 'package:boking_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:logger/web.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final AuthControllerController authControllerController =
      AuthControllerController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: context.height(25)),
              Image.asset(
                'assets/images/logo_mrt.png',
                width: 200,
                height: 200,
              ),

              TextinputCustom(
                hintText: 'Phone',
                obscureText: false,
                controller: phoneController,
                color: Colors.grey[200]!,
              ),
              const SizedBox(height: 20),

              TextinputCustom(
                hintText: 'Password',
                obscureText: true,
                controller: passwordController,
                color: Colors.grey[200]!,
              ),
              SizedBox(height: context.height(2)),
              Text('Forget Password?', style: TextStyle(fontSize: 16)),
              SizedBox(height: context.height(2)),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: BottomCostom(
                  label: 'Login',
                  Controller: () {
                    authControllerController.login(
                      phoneController.text,
                      passwordController.text,
                    );
                    Logger().i(
                      'Login attempted with phone: ${phoneController.text} and password: ${passwordController.text}',
                    );
                  },
                  color: Colors.blue,
                ),
              ),

              SizedBox(height: context.height(0.5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      // Navigate to the registration page
                      // Get.to(RegistrationView());
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
