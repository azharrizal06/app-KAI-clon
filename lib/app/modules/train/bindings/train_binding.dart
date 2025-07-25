import 'package:get/get.dart';

import '../controllers/train_controller.dart';

class TrainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrainController>(
      () => TrainController(),
    );
  }
}
