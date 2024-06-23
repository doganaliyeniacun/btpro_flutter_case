import 'package:btpro_flutter_case/src/features/movie/model/movie.dart';
import 'package:btpro_flutter_case/src/features/movie/service/movie_service.dart';
import 'package:btpro_flutter_case/src/product/resources/app_http.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

abstract class IMovieViewModel {
  RxList<Movie> get moviesList;
  Future<void> getMovies(String movieName);
}

class MovieViewModel extends GetxController implements IMovieViewModel {
  late final IMovieService service;
  late final Dio _dio;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppHttp.BASE_URL,
        queryParameters: {'apikey': AppHttp.apiKey},
      ),
    );
    service = Get.put(MovieService(_dio));
  }

  @override
  RxList<Movie> get moviesList => service.moviesList;

  @override
  Future<void> getMovies(String movieName) async {
    _checkLoading();
    await service.fetchMovies(movieName);
    _checkLoading();
  }

  void _checkLoading() => isLoading.value = !isLoading.value;
}
