import 'package:btpro_flutter_case/src/features/favorite_movie/model/favorite_movie.dart';
import 'package:get/get.dart';

import '../service/favorite_movie_service.dart';

class FavoriteMovieViewModel extends GetxController {
  late final IFavoriteMovieService _service;
  RxList<FavoriteMovie> favoritesList = <FavoriteMovie>[].obs;

  @override
  void onInit() async {
    _service = Get.find<FavoriteMovieService>();
    await _getFavoriteMoviesList();
    super.onInit();
  }

  Future<void> _getFavoriteMoviesList() async {
    final list = await _service.getAllFavoriteMovies();
    favoritesList.assignAll(list ?? []);
  }

  Future<void> unfavoriteMovie(String imdbId) async {
    final FavoriteMovie? favoriteMovie =
        await _service.getMovie(imdbId);
    if (favoriteMovie != null) {
      await _service.changeFavoriteState(favoriteMovie);
      await _getFavoriteMoviesList();
    }
  }
}
