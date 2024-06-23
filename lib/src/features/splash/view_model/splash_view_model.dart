import 'package:btpro_flutter_case/src/product/firebase/remote_config/remote_config_keys.dart';
import 'package:btpro_flutter_case/src/product/firebase/remote_config/service/remote_config_service.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../../../product/network/network_controller.dart';
import '../../../product/resources/app_routes.dart';

class SplashViewModel extends GetxController {
  final RxString splashText = ''.obs;

  @override
  void onInit() {
    super.onInit();

    FlutterNativeSplash.remove();
    splashText.value =
        Get.find<RemoteConfigService>().getString(RemoteConfigKeys.SPLASH_TEXT);
  }

  @override
  void onReady() {
    super.onReady();

    final networkController = Get.put<NetworkController>(
      NetworkController(),
      permanent: true,
    );
    networkController.isConnected = _goToTheMoviePage;
  }

  void _goToTheMoviePage({int delaySec = 3}) {
    bool isSplashPage = Get.currentRoute.contains(Routes.SPLASH);

    if (isSplashPage) {
      Future.delayed(Duration(seconds: delaySec)).then(
        (value) {
          Get.offAllNamed(Routes.MOVIE);
        },
      );
    }
  }
}
