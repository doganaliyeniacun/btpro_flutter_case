import 'package:btpro_flutter_case/src/product/firebase/analytics/service/analytics_service.dart';
import 'package:btpro_flutter_case/src/product/navigation/app_pages.dart';
import 'package:btpro_flutter_case/src/product/resources/app_strings.dart';
import 'package:btpro_flutter_case/src/product/theme/app_theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:btpro_flutter_case/src/product/init/app_init.dart';
import 'package:flutter/services.dart';

void main() async {
  await AppInit.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const _MyApp(),
      ),
    );
  });
}

class _MyApp extends StatelessWidget {
  const _MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: true,
      title: AppStrings.APP_TITLE,
      theme: getApplicationTheme(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      navigatorObservers: [Get.find<AnalyticsService>().getAnalyticsObserver()],
    );
  }
}
