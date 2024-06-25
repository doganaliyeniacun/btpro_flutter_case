import 'package:btpro_flutter_case/src/features/movie/model/favorite_movie.dart';
import 'package:get/get.dart';

import '../service/favorite_movie_service.dart';

class FavoriteMovieViewModel extends GetxController {
  late final IFavoriteMovieService _service;

  @override
  void onInit() async {
    _service = Get.find<FavoriteMovieService>();
    super.onInit();
  }

  RxList<FavoriteMovie>? get favoriteMovies => _service.favoriteMoviesList;

  /// This Dart function unfavorites a movie by retrieving it from a service and changing its favorite
  /// state if it exists.
  /// 
  /// Args:
  ///   imdbId (String): The `imdbId` parameter is a unique identifier for a movie on the IMDb website.
  /// It is used to identify a specific movie in the database.
  Future<void> unFavoriteMovie(String imdbId) async {
    final FavoriteMovie? favoriteMovie = await _service.getMovie(imdbId);
    if (favoriteMovie != null) {
      await _service.changeFavoriteState(favoriteMovie);
    }
  }
}
