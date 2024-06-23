import 'package:btpro_flutter_case/src/product/resources/app_strings.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../model/favorite_movie.dart';

abstract class IFavoritesMovieService {
  Future<void> add(FavoriteMovie movie);
  Future<FavoriteMovie?> get(String imdbId);
  Future<List<FavoriteMovie>> getAll();
  Future<bool> getFavoriteState(String imdbId);
  Future<bool> changeFavoriteState(FavoriteMovie favoriteMovie);
}

class FavoriteMoviesService extends GetxController
    implements IFavoritesMovieService {
  late final Box<FavoriteMovie> box;

  @override
  void onInit() async {
    await Hive.initFlutter();
    Hive.registerAdapter(FavoriteMovieAdapter());
    Hive.openBox<FavoriteMovie>(AppStrings.HIVE_FAVORITE_BOX_NAME);
    box = await Hive.openBox<FavoriteMovie>(AppStrings.HIVE_FAVORITE_BOX_NAME);
    super.onInit();
  }

  @override
  Future<void> add(FavoriteMovie movie) async {
    await box.add(movie);
  }

  @override
  Future<FavoriteMovie?> get(String imdbId) async {
    final list = await getAll();
    if (list.isEmpty) {
      return null;
    }
    final FavoriteMovie favoriteMovie = list.firstWhere(
      (e) => e.imdbId == imdbId,
    );
    return favoriteMovie;
  }

  @override
  Future<List<FavoriteMovie>> getAll() async {
    return box.values.toList();
  }

  Future<void> _toggleFavorite(FavoriteMovie movie) async {
    movie.isFavorite = !movie.isFavorite;
    await movie.save();
  }

  @override
  Future<bool> getFavoriteState(String imdbId) async {
    final FavoriteMovie? favoriteMovie = await get(imdbId);
    if (favoriteMovie == null) {
      return false;
    } else {
      return favoriteMovie.isFavorite;
    }
  }

  @override
  Future<bool> changeFavoriteState(
    FavoriteMovie favoriteMovie,
  ) async {
    final FavoriteMovie? checkMovie = await get(favoriteMovie.imdbId);

    if (checkMovie == null) {
      await add(favoriteMovie);
      return true;
    } else {
      await _toggleFavorite(checkMovie);
      return checkMovie.isFavorite;
    }
  }
}
