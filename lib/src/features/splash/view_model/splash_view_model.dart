import 'package:btpro_flutter_case/src/product/firebase/remote_config/remote_config_keys.dart';
import 'package:btpro_flutter_case/src/product/firebase/remote_config/remote_config_service.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../../../product/network/network_controller.dart';
import '../../../product/routes/app_routes.dart';

class SplashViewModel extends GetxController {
  final RxString splash_text = ''.obs;

  @override
  void onInit() {
    super.onInit();
    FlutterNativeSplash.remove();
    Get.find<NetworkController>().isConnected = _goToTheHomePage;
    splash_text.value =
        Get.find<RemoteConfigService>().getString(RemoteConfigKeys.SPLASH_TEXT);
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
