import 'package:btpro_flutter_case/src/features/movie/service/movie_service.dart';
import 'package:get/get.dart';

import '../model/movie.dart';

class MovieDetailViewModel extends GetxController {
  late final IMovieService _service;
  late final String? _imdbId;
  late final Movie? movie;

  @override
  void onInit() {
    _service = Get.find<IMovieService>();
    _imdbId = Get.arguments;
    movie = _findMovieById(_service.moviesList, _imdbId ?? '');
    super.onInit();
  }

  Movie? _findMovieById(List<Movie> movies, String imdbId) {
    return movies.firstWhere((movie) => movie.imdbId == imdbId);
  }
}
