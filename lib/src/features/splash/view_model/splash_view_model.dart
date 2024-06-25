import 'package:btpro_flutter_case/src/product/firebase/remote_config/remote_config_keys.dart';
import 'package:btpro_flutter_case/src/product/firebase/remote_config/service/remote_config_service.dart';
import 'package:btpro_flutter_case/src/product/resources/app_strings.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../../../product/network/service/network_service.dart';
import '../../../product/navigation/app_routes.dart';

class SplashViewModel extends GetxController {
  final RxString splashText = ''.obs;

  @override
  void onInit() {
    super.onInit();

    FlutterNativeSplash.remove();
    splashText.value =
        Get.find<RemoteConfigService>().getString(RemoteConfigKeys.SPLASH_TEXT);
    final networkService = Get.put<NetworkService>(
      NetworkService(messageText: AppStrings.CHECK_YOUR_CONNECTION),
      permanent: true,
    );
    networkService.onConnected = _goToTheNextPage;
  }

  /// This function checks if the current route is a splash page and then navigates to the home
  /// page after a specified delay.
  /// 
  /// Args:
  ///   delaySec (int): The `delaySec` parameter is an optional parameter of type `int` with a default
  /// value of `3`. It is used to specify the number of seconds to delay before navigating to the next
  /// page. If no value is provided when calling the function `_goToTheNextPage`, it will default.
  /// Defaults to 3
  void _goToTheNextPage({int delaySec = 3}) {
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
