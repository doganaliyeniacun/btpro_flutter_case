import 'package:btpro_flutter_case/src/product/widgets/custom_snackbar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkService extends GetxController {
  final Connectivity _connectivity = Connectivity();
  late final String? messageText;
  VoidCallback? onConnected;

  NetworkService({
    this.messageText,
  });

  @override
  void onInit() {
    super.onInit();
    /// The line `_connectivity.onConnectivityChanged.listen(_updateStatus);` in the `NetworkService`
    /// class is setting up a listener for changes in network connectivity status.
    _connectivity.onConnectivityChanged.listen(_updateStatus);
  }

  /// The `_updateStatus` function checks for network connectivity status and displays a custom snackbar
  /// message if there is no connection.
  /// 
  /// Args:
  ///   result (List<ConnectivityResult>): The `result` parameter is a list of `ConnectivityResult`
  /// objects. The function `_updateStatus` checks if the list contains `ConnectivityResult.none` and
  /// then either displays a custom snackbar with a message or calls a callback function `onConnected`
  /// and closes any open snackbar if
  void _updateStatus(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.none)) {
      customSnackBar(messageText);
    } else {
      if (onConnected != null) {
        onConnected!();
      }
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}
