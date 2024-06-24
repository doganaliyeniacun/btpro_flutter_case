import 'package:btpro_flutter_case/src/product/resources/app_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController customSnackBar(
  String? messageText, {
  double fontSize = 14,
}) {
  return Get.rawSnackbar(
    messageText: Text(
      messageText ?? '',
      style: TextStyle(
        fontSize: fontSize,
      ),
    ),
    isDismissible: false,
    duration: const Duration(days: 1),
    backgroundColor: Get.theme.colorScheme.error,
    icon: const Icon(
      Icons.wifi_off,
      size: AppSize.S_34,
    ),
    margin: EdgeInsets.zero,
    snackStyle: SnackStyle.GROUNDED,
  );
}
