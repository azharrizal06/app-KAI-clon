import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/login_view.dart';
import '../modules/home/views/register_view.dart';
import '../modules/train/bindings/train_binding.dart';
import '../modules/train/views/train_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TRAIN,
      page: () => const TrainView(),
      binding: TrainBinding(),
    ),
  ];
}
