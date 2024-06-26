import 'package:btpro_flutter_case/src/features/movie/service/favorite_movie_service.dart';
import 'package:btpro_flutter_case/src/product/firebase/analytics/service/analytics_service.dart';
import 'package:btpro_flutter_case/src/product/resources/app_strings.dart';
import 'package:btpro_flutter_case/src/product/util/logger/service/logger_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../firebase/firebase_options.dart';
import '../firebase/notifications/service/firebase_notifications_service.dart';
import '../firebase/remote_config/service/remote_config_service.dart';

class AppInit {
  static Future<void> init() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

    // splash
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    //dotenv
    await dotenv.load(fileName: AppStrings.DOT_ENV);

    //firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
    await FirebaseNotificationsService().initNotifications();

    // Dependency
    Get.put(LoggerService(), permanent: true);
    Get.put(RemoteConfigService(), permanent: true);
    Get.put(AnalyticsService(), permanent: true);
    Get.put(FavoriteMovieService(), permanent: true);
  }
}
