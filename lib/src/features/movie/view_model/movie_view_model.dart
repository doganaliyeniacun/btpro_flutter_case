import 'package:btpro_flutter_case/src/features/movie/model/movie.dart';
import 'package:btpro_flutter_case/src/features/movie/service/movie_service.dart';
import 'package:btpro_flutter_case/src/product/resources/app_http.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../service/interface/i_movie_service.dart';

enum RequestStatus { INITIAL, LOADING, SUCCESS, NOT_FOUND, ERROR }

abstract class IMovieViewModel {
  RxList<Movie> get moviesList;
  Future<void> getMovies(String movieName);
}

class MovieViewModel extends GetxController implements IMovieViewModel {
  late final IMovieService _service;
  late final Dio _dio;

  final requestStatus = RequestStatus.INITIAL.obs;

  @override
  void onInit() {
    super.onInit();
    _dio = Dio(
      BaseOptions(
        baseUrl: AppHttp.BASE_URL,
        queryParameters: AppHttp.baseQueryParameters,
      ),
    );
    _service = Get.put(MovieService(_dio));
  }

  @override
  RxList<Movie> get moviesList => _service.moviesList;

  @override
  Future<void> getMovies(String movieName) async {
    try {
      _loading();
      await _service.fetchMovies(movieName);
      _success();
      _notFound();
    } on DioException catch (e) {
      _error(e);
    }
  }

  void setRequestStatus(RequestStatus value) => requestStatus.value = value;

  void _success() => setRequestStatus(RequestStatus.SUCCESS);

  void _loading() => setRequestStatus(RequestStatus.LOADING);

  void _notFound() {
    if (moviesList.first.error != null) {
      setRequestStatus(RequestStatus.NOT_FOUND);
      final message = moviesList.first.error;
      Get.rawSnackbar(message: message, duration: const Duration(seconds: 3));
    }
  }

  void _error(DioException e) {
    setRequestStatus(RequestStatus.ERROR);
    Get.rawSnackbar(message: e.message, duration: const Duration(seconds: 3));
  }
}
