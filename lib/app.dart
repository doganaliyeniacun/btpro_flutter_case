import 'package:btpro_flutter_case/src/product/firebase/analytics/service/analytics_service.dart';
import 'package:btpro_flutter_case/src/product/navigation/app_pages.dart';
import 'package:btpro_flutter_case/src/product/resources/app_strings.dart';
import 'package:btpro_flutter_case/src/product/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.APP_TITLE,
      theme: getApplicationTheme(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      navigatorObservers: [Get.find<AnalyticsService>().getAnalyticsObserver()],
    );
  }
}
