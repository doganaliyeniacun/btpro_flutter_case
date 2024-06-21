import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../../../product/routes/app_routes.dart';
import '../../../product/widgets/custom_snackbar.dart';

class SplashViewModel extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    FlutterNativeSplash.remove();
    _connectivity.onConnectivityChanged.listen(_updateStatus);
  }

  void _updateStatus(List<ConnectivityResult> result) {
    const String messageText = 'Lütfen internet bağlantınızı kontrol ediniz.';

    if (result.contains(ConnectivityResult.none)) {
      customSnackBar(messageText);
    } else {
      // Go to the home page
      _goToTheHomePage();

      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }

  Future<dynamic> _goToTheHomePage() =>
      Future.delayed(const Duration(seconds: 3)).then(
        (value) {
          Get.offAllNamed(Routes.HOME);
        },
      );
}
