import 'package:btpro_flutter_case/src/product/network/network_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class AppSetup {
  static Future<void> init() async {
    Get.put<NetworkController>(NetworkController(), permanent: true);
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  }
}
