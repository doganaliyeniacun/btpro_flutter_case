import 'package:btpro_flutter_case/src/product/widgets/custom_snackbar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  late final String? messageText;
  VoidCallback? isConnected;

  NetworkController({
    this.messageText = 'Please check your internet connection!',
  });

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateStatus);
  }

  void _updateStatus(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.none)) {
      customSnackBar(messageText);
    } else {
      if (isConnected != null) {
        isConnected!();
      }
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}
