import 'package:get/get.dart';

import '../../model/favorite_movie.dart';

abstract class IFavoriteMovieService {
  late final RxList<FavoriteMovie>? favoriteMoviesList;
  Future<void> addFavoriteMovie(FavoriteMovie movie);
  Future<FavoriteMovie?> getMovie(String imdbId);
  Future<List<FavoriteMovie>?> getAllMovies();
  Future<List<FavoriteMovie>?> getAllFavoriteMovies();
  Future<bool> getFavoriteState(String imdbId);
  Future<bool> changeFavoriteState(FavoriteMovie favoriteMovie);
}