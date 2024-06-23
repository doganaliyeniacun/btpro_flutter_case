import 'package:btpro_flutter_case/src/features/movie/service/movie_service.dart';
import 'package:btpro_flutter_case/src/product/firebase/analytics/service/analytics_service.dart';
import 'package:get/get.dart';

import '../model/movie.dart';

class MovieDetailsViewModel extends GetxController {
  late final IMovieService _service;
  late final String? _imdbId;
  late final Movie? movie;
  late final AnalyticsService _analyticsService;

  @override
  void onInit() {
    _service = Get.find<IMovieService>();
    _analyticsService = Get.put<AnalyticsService>(AnalyticsService());
    _imdbId = Get.arguments;
    movie = _findMovieById(_service.moviesList, _imdbId ?? '');
    _analyticsService.logMovieEvent(movie!);
    super.onInit();
  }

  Movie? _findMovieById(List<Movie> movies, String imdbId) {
    return movies.firstWhere((movie) => movie.imdbId == imdbId);
  }
}
