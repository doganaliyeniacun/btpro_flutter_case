import 'dart:io';

import 'package:btpro_flutter_case/src/features/movie/service/movie_service.dart';
import 'package:btpro_flutter_case/src/product/constants/app/app_constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  late final IMovieService service;

  setUp(() {
    dotenv.testLoad(fileInput: File('.env').readAsStringSync());
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: AppConstant.BASE_URL,
        queryParameters: AppConstant.BASE_QUERY_PARAMETERS,
      ),
    );
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
