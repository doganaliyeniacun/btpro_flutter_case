import 'package:btpro_flutter_case/src/features/home/service/movie_service.dart';
import 'package:btpro_flutter_case/src/product/constants/app/app_constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  late final IMovieService service;

  setUp(() {
    final Dio dio = Dio(
        BaseOptions(baseUrl: AppConstant.BASE_URL, queryParameters: {'apikey': '2e999381'}));
    service = Get.put(MovieService(dio));
  });

  test(
    'Movie list is not empty',
    () async {
      await service.fetchMovies('blade');
      expect(service.moviesList, isNotEmpty);
    },
  );

  test(
    'Movie not found',
    () async {
      await service.fetchMovies('qweqweqweqwe');      
      expect(service.moviesList.first.error, isNotEmpty);
    },
  );
}
