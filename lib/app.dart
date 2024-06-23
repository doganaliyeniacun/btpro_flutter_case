import 'package:btpro_flutter_case/src/product/firebase/analytics/service/analytics_service.dart';
import 'package:btpro_flutter_case/src/product/resources/app_pages.dart';
import 'package:btpro_flutter_case/src/product/resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Case',
      theme: getApplicationTheme(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      navigatorObservers: [Get.find<AnalyticsService>().getAnalyticsObserver()],
    );
  }
}
