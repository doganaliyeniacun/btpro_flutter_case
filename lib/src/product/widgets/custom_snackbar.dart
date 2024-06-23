import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController customSnackBar(
  String? messageText, {
  double fontSize = 14,
  Color textColor = Colors.white,
}) {
  return Get.rawSnackbar(
    messageText: Text(
      messageText ?? '',
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
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
