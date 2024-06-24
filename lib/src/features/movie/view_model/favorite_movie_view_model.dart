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

  Future<void> unfavoriteMovie(String imdbId) async {
    final FavoriteMovie? favoriteMovie = await _service.getMovie(imdbId);
    if (favoriteMovie != null) {
      await _service.changeFavoriteState(favoriteMovie);
    }
  }
}
