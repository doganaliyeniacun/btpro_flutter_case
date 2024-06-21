import 'package:btpro_flutter_case/src/product/firebase/remote_config/remote_config_keys.dart';
import 'package:btpro_flutter_case/src/product/firebase/remote_config/remote_config_service.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../../../product/network/network_controller.dart';
import '../../../product/routes/app_routes.dart';

class SplashViewModel extends GetxController {
  final RxString splashText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    FlutterNativeSplash.remove();
    splashText.value =
        Get.find<RemoteConfigService>().getString(RemoteConfigKeys.SPLASH_TEXT);
    Get.find<NetworkController>().isConnected = _goToTheHomePage;
  }

  void _goToTheHomePage({
    int delaySec = 3,
  }) {
    if (Get.currentRoute.contains(Routes.SPLASH)) {
      Future.delayed(Duration(seconds: delaySec)).then(
        (value) {
          Get.offAllNamed(Routes.HOME);
        },
      );
    }
  }
}
