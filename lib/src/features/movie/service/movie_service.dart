import 'package:get/get.dart';
import 'package:dio/dio.dart';

import '../model/movie.dart';

abstract class IMovieService {
  late final RxList<Movie> moviesList;
  Future<void> fetchMovies(String movieName);
}

class MovieService extends GetxController implements IMovieService {
  final Dio _dio;

  @override
  RxList<Movie> moviesList = <Movie>[].obs;

  MovieService(this._dio);

  @override
  Future<void> fetchMovies(String movieName) async {
    try {
      final response = await _dio.get('/', queryParameters: {'t': movieName});

      moviesList.value = [];

      if (response.statusCode == 200) {
        final data = response.data;

        if (data is Map<String, dynamic>) {
          moviesList.assign(Movie.fromJson(data));
        }

        if (data is List<dynamic>) {
          final list = data.map((e) => Movie.fromJson(e)).toList();
          moviesList.assignAll(list);
        }
      }
    } on DioException {
      rethrow;
    }
  }
}
