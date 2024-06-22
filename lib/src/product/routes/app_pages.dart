import 'package:btpro_flutter_case/src/features/home/view/home_view.dart';
import 'package:btpro_flutter_case/src/product/routes/app_routes.dart';
import 'package:get/get.dart';

import '../../features/home/bindings/home_binding.dart';
import '../../features/splash/bindings/splash_binding.dart';
import '../../features/splash/view/splash_view.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
