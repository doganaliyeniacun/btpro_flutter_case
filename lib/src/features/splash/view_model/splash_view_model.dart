import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../../../product/network/network_controller.dart';
import '../../../product/routes/app_routes.dart';


class SplashViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
    FlutterNativeSplash.remove();
    Get.put(NetworkController(isConnected: _goToTheHomePage));    
  }

  

  Future<dynamic> _goToTheHomePage() =>
      Future.delayed(const Duration(seconds: 3)).then(
        (value) {
          Get.offAllNamed(Routes.HOME);
        },
      );
}
