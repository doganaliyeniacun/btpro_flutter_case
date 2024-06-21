import 'package:btpro_flutter_case/src/features/splash/view_model/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Get.find<SplashViewModel>();

    return Scaffold(
      body: Center(
        child: Obx(
          () => Text(
            vm.splash_text.value,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
