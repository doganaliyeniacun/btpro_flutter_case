// ignore_for_file: constant_identifier_names

import 'package:btpro_flutter_case/src/features/movie/view/movie_view.dart';
import 'package:btpro_flutter_case/src/product/resources/app_routes.dart';
import 'package:get/get.dart';

import '../../features/movie/bindings/movie_binding.dart';
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
      name: AppRoutes.MOVIE,
      page: () => const MovieView(),
      binding: MovieBinding(),
    ),
    GetPage(
      name: AppRoutes.MOVIE_DETAIL,
      page: () => const MovieDetailView(),
      binding: MovieDetailBinding(),
    ),
  ];
}
