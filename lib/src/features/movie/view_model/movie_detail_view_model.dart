import 'package:btpro_flutter_case/src/features/movie/model/favorite_movie.dart';
import 'package:btpro_flutter_case/src/features/movie/service/favorite_movie_service.dart';
import 'package:btpro_flutter_case/src/features/movie/service/movie_service.dart';
import 'package:btpro_flutter_case/src/product/firebase/analytics/service/analytics_service.dart';
import 'package:get/get.dart';

import '../model/movie.dart';

class MovieDetailViewModel extends GetxController {
  late final IMovieService _service;
  late final IFavoriteMovieService favoriteMoviesService;
  late final String? _imdbId;
  late final Movie movie;
  late final AnalyticsService _analyticsService;
  RxBool isFavorite = false.obs;

  @override
  void onInit() async {
    _service = Get.find<IMovieService>();
    favoriteMoviesService = Get.find<FavoriteMovieService>();
    _analyticsService = Get.find<AnalyticsService>();

    _imdbId = Get.arguments;
    movie = _findMovieById(_service.moviesList, _imdbId ?? '');
    isFavorite.value =
        await favoriteMoviesService.getFavoriteState(_imdbId ?? '');
    await _logMovie();
    super.onInit();
  }

  Future<void> _logMovie() async {
    Map<String, dynamic> dynamicMap = movie.toJson();
    Map<String, Object> objectMap =
        dynamicMap.map((key, value) => MapEntry(key, value ?? '' as Object));

    await _analyticsService.logEvent(
      eventName: 'movie_event',
      parameters: objectMap,
    );
  }

  Movie _findMovieById(List<Movie> movies, String imdbId) {
    return movies.firstWhere((movie) => movie.imdbId == imdbId);
  }

  void changeFavoriteState() async {
    final favoriteMovie = FavoriteMovie(
      imdbId: _imdbId ?? '',
      title: movie.title ?? '',
      imageUrl: movie.poster ?? '',
      isFavorite: true,
    );
    final result =
        await favoriteMoviesService.changeFavoriteState(favoriteMovie);

    isFavorite.value = result;
  }
}
