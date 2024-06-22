import 'package:btpro_flutter_case/src/features/home/model/movie.dart';
import 'package:btpro_flutter_case/src/features/home/service/movie_service.dart';
import 'package:btpro_flutter_case/src/product/constants/app/app_constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

abstract class IHomeViewModel {
  RxList<Movie> get moviesList;
  Future<void> getMovies(String movieName);
}

class HomeViewModel extends GetxController implements IHomeViewModel {
  late final IMovieService service;
  late final Dio _dio;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConstant.BASE_URL,
        queryParameters: {'apikey': AppConstant.API_KEY},
      ),
    );
    service = Get.put(MovieService(_dio));
  }

  @override
  RxList<Movie> get moviesList => service.moviesList;

  @override
  Future<void> getMovies(String movieName) async {
    checkLoading();
    await service.fetchMovies(movieName);
    checkLoading();
  }

  void checkLoading() => isLoading.value = !isLoading.value;
}
