import 'package:btpro_flutter_case/src/features/splash/view_model/splash_view_model.dart';
import 'package:btpro_flutter_case/src/product/resources/app_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Get.find<SplashViewModel>();
    final theme = context.theme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Obx(
          () => Text(
            vm.splashText.value,
            style:  TextStyle(
              fontSize: AppSize.S_30,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.surface
            ),
          ),
        ),
      ),
    );
  }
}
