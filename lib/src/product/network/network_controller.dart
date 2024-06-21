import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateStatus);
  }

  void _updateStatus(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.none)) {
      _showSnackBar();
    } else {
      _goToHomePage();

      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }

  void _goToHomePage() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      Get.offAllNamed(Routes.HOME);
    });
  }

  SnackbarController _showSnackBar() {
    const String messageText = 'Lütfen internet bağlantınızı kontrol ediniz.';

    return Get.rawSnackbar(
      messageText: const Text(
        messageText,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      isDismissible: false,
      duration: const Duration(days: 1),
      backgroundColor: Colors.red[400]!,
      icon: const Icon(
        Icons.wifi_off,
        color: Colors.white,
        size: 35,
      ),
      margin: EdgeInsets.zero,
      snackStyle: SnackStyle.GROUNDED,
    );
  }
}
