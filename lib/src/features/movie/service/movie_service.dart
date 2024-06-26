import 'package:get/get.dart';
import 'package:dio/dio.dart';

import '../model/movie.dart';
import 'interface/i_movie_service.dart';

class MovieService extends GetxController implements IMovieService {
  final Dio _dio;

  @override
  RxList<Movie> moviesList = <Movie>[].obs;

  MovieService(this._dio);

  /// This function fetches movies based on a given movie name using Dio library in Dart and updates the
  /// movies list accordingly.
  ///
  /// Args:
  ///   movieName (String): The `movieName` parameter in the `fetchMovies` method is a string that
  /// represents the name of the movie that you want to fetch information for. This parameter is used to
  /// construct the query parameters for the API request to fetch movie data.
  @override
  Future<void> fetchMovies(String movieName) async {
    const path = '';
    Map<String, dynamic> queryParameters = {'t': movieName};

    try {
      final response = await _dio.get(path, queryParameters: queryParameters);

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
