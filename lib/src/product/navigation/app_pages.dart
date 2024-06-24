// ignore_for_file: constant_identifier_names

import 'package:btpro_flutter_case/src/features/home/view/home_view.dart';
import 'package:btpro_flutter_case/src/features/movie/view/movie_view.dart';
import 'package:btpro_flutter_case/src/product/navigation/app_routes.dart';
import 'package:get/get.dart';

import '../../features/movie/view/movie_detail_view.dart';
import '../../features/splash/bindings/splash_binding.dart';
import '../../features/splash/view/splash_view.dart';

class AppPages {
  static const INITIAL = AppRoutes.SPLASH;

  static final routes = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
    ),
    GetPage(
      name: AppRoutes.MOVIE,
      page: () => const MovieView(),
    ),
    GetPage(
      name: AppRoutes.MOVIE_DETAIL,
      page: () => const MovieDetailView(),
    ),
  ];
}
