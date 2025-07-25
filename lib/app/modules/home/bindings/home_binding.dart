import 'package:boking_app/app/modules/home/controllers/auth_controller_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AuthControllerController>(() => AuthControllerController());
  }
}
