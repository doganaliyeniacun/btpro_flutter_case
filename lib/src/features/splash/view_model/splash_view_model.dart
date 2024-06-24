import 'package:btpro_flutter_case/src/product/firebase/remote_config/remote_config_keys.dart';
import 'package:btpro_flutter_case/src/product/firebase/remote_config/service/remote_config_service.dart';
import 'package:btpro_flutter_case/src/product/resources/app_strings.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../../../product/network/service/network_service.dart';
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

    final networkService = Get.put<NetworkService>(
      NetworkService(messageText: AppStrings.CHECK_YOUR_CONNECTION),
      permanent: true,
    );
    networkService.isConnected = _goToTheMoviePage;
  }

  void _goToTheMoviePage({int delaySec = 3}) {
    bool isSplashPage = Get.currentRoute.contains(AppRoutes.SPLASH);

    if (isSplashPage) {
      Future.delayed(Duration(seconds: delaySec)).then(
        (value) {
          Get.offAllNamed(AppRoutes.HOME);
        },
      );
    }
  }
}
