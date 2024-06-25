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

  /// This function retrieves a favorite movie by its IMDb ID from a list of all favorite movies.
  /// 
  /// Args:
  ///   imdbId (String): The `imdbId` parameter is a unique identifier for a movie on the IMDb website.
  /// It is used to look up specific information about a movie, such as its title, cast, plot, and
  /// ratings.
  /// 
  /// Returns:
  ///   The `getMovie` method is returning a `Future` that resolves to a `FavoriteMovie` object with the
  /// specified IMDb ID, or `null` if no matching movie is found in the list of all movies.
  @override
  Future<FavoriteMovie?> getMovie(String imdbId) async {
    final List<FavoriteMovie>? list = await getAllMovies();

    final FavoriteMovie? favoriteMovie =
        list?.firstWhereOrNull((e) => e.imdbId == imdbId);

    return favoriteMovie;
  }

  /// This function returns a list of all favorite movies stored in a box.
  /// 
  /// Returns:
  ///   A list of FavoriteMovie objects is being returned.
  @override
  Future<List<FavoriteMovie>?> getAllMovies() async {
    return _box.values.toList();
  }

  /// This function retrieves all favorite movies from a list of movies.
  /// 
  /// Returns:
  ///   The `getAllFavoriteMovies` method is returning a `Future` that resolves to a list of
  /// `FavoriteMovie` objects that have the `isFavorite` property set to `true`.
  @override
  Future<List<FavoriteMovie>?> getAllFavoriteMovies() async {
    final list = await getAllMovies();
    final favoriteList = list?.where((e) => e.isFavorite == true).toList();
    return favoriteList;
  }

  /// This function retrieves the favorite state of a movie with a given IMDb ID.
  /// 
  /// Args:
  ///   imdbId (String): The `imdbId` parameter is a unique identifier for a movie on the IMDb (Internet
  /// Movie Database) website. It is used to retrieve information about a specific movie, such as its
  /// title, genre, release year, and more. In the provided code snippet, the `imdbId`
  /// 
  /// Returns:
  ///   A `Future<bool>` is being returned. The method `getFavoriteState` checks if a movie with the
  /// given IMDb ID is a favorite or not, and returns `true` if it is a favorite, and `false` if it is
  /// not found or not a favorite.
  @override
  Future<bool> getFavoriteState(String imdbId) async {
    final FavoriteMovie? favoriteMovie = await getMovie(imdbId);
    if (favoriteMovie == null) {
      return false;
    } else {
      return favoriteMovie.isFavorite;
    }
  }

  /// This function adds a favorite movie to a storage box asynchronously.
  /// 
  /// Args:
  ///   movie (FavoriteMovie): The `movie` parameter is an instance of the `FavoriteMovie` class, which
  /// represents a movie that the user wants to add to their list of favorite movies.
  @override
  Future<void> addFavoriteMovie(FavoriteMovie movie) async {
    await _box.add(movie);
  }

  /// This function changes the favorite state of a movie and updates the favorite list accordingly.
  /// 
  /// Args:
  ///   favoriteMovie (FavoriteMovie): The `favoriteMovie` parameter is an object of type
  /// `FavoriteMovie` that represents a movie that the user wants to mark as a favorite. It contains
  /// information such as the IMDb ID of the movie and its current favorite state.
  /// 
  /// Returns:
  ///   The method `changeFavoriteState` returns a `Future<bool>` value, which represents whether the
  /// movie's favorite state has been successfully changed.
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

  /// This function retrieves all favorite movies and assigns them to a list of favorite movies.
  Future<void> _setFavoriteList() async {
    final favoriteList = await getAllFavoriteMovies();
    favoriteMoviesList?.assignAll(favoriteList ?? []);
  }
}
