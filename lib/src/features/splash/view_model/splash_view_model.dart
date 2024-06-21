import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../../../product/network/network_controller.dart';
import '../../../product/routes/app_routes.dart';

class SplashViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
    FlutterNativeSplash.remove();
    Get.find<NetworkController>().isConnected = _goToTheHomePage;
  }

  void _goToTheHomePage() {
    if (Get.currentRoute.contains(Routes.SPLASH)) {
      Future.delayed(const Duration(seconds: 3)).then(
        (value) {
          Get.offAllNamed(Routes.HOME);
        },
      );
    }
  }
}
