import 'package:btpro_flutter_case/src/product/resources/app_strings.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../model/favorite_movie.dart';

abstract class IFavoriteMovieService {
  late final RxList<FavoriteMovie>? favoriteMoviesList;
  Future<void> addFavoriteMovie(FavoriteMovie movie);
  Future<FavoriteMovie?> getMovie(String imdbId);
  Future<List<FavoriteMovie>?> getAllMovies();
  Future<List<FavoriteMovie>?> getAllFavoriteMovies();
  Future<bool> getFavoriteState(String imdbId);
  Future<bool> changeFavoriteState(FavoriteMovie favoriteMovie);
}

class FavoriteMovieService extends GetxController
    implements IFavoriteMovieService {
  late final Box<FavoriteMovie> _box;

  @override
  RxList<FavoriteMovie>? favoriteMoviesList = <FavoriteMovie>[].obs;

  @override
  void onInit() async {
    await Hive.initFlutter();
    Hive.registerAdapter(FavoriteMovieAdapter());
    Hive.openBox<FavoriteMovie>(AppStrings.HIVE_FAVORITE_BOX_NAME);
    _box = await Hive.openBox<FavoriteMovie>(AppStrings.HIVE_FAVORITE_BOX_NAME);
    await _setFavoriteList();
    super.onInit();
  }

  @override
  Future<FavoriteMovie?> getMovie(String imdbId) async {
    final List<FavoriteMovie>? list = await getAllMovies();

    final FavoriteMovie? favoriteMovie =
        list?.firstWhereOrNull((e) => e.imdbId == imdbId);

    return favoriteMovie;
  }

  @override
  Future<List<FavoriteMovie>?> getAllMovies() async {
    return _box.values.toList();
  }

  @override
  Future<List<FavoriteMovie>?> getAllFavoriteMovies() async {
    final list = await getAllMovies();
    final favoriteList = list?.where((e) => e.isFavorite == true).toList();
    return favoriteList;
  }

  @override
  Future<bool> getFavoriteState(String imdbId) async {
    final FavoriteMovie? favoriteMovie = await getMovie(imdbId);
    if (favoriteMovie == null) {
      return false;
    } else {
      return favoriteMovie.isFavorite;
    }
  }

  @override
  Future<void> addFavoriteMovie(FavoriteMovie movie) async {
    await _box.add(movie);
  }

  @override
  Future<bool> changeFavoriteState(FavoriteMovie favoriteMovie) async {
    final FavoriteMovie? checkMovie = await getMovie(favoriteMovie.imdbId);

    if (checkMovie == null) {
      await addFavoriteMovie(favoriteMovie);
      await _setFavoriteList();
      return favoriteMovie.isFavorite;
    } else {
      checkMovie.isFavorite = !checkMovie.isFavorite;
      await checkMovie.save();
      await _setFavoriteList();
      return checkMovie.isFavorite;
    }
  }

  Future<void> _setFavoriteList() async {
    final favoriteList = await getAllFavoriteMovies();
    favoriteMoviesList?.assignAll(favoriteList ?? []);
  }
}
