import 'package:btpro_flutter_case/src/product/resources/app_strings.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../model/favorite_movie.dart';

abstract class IFavoriteMovieService {
  Future<void> add(FavoriteMovie movie);
  Future<void> remove(FavoriteMovie movie);
  Future<List<FavoriteMovie>> getAll();
  Future<void> toggleFavorite(FavoriteMovie movie);
}

class FavoriteMoviesService extends GetxController implements IFavoriteMovieService {
  @override
  void onInit() async {
    await Hive.initFlutter();
    Hive.registerAdapter(FavoriteMovieAdapter());
    Hive.openBox<FavoriteMovie>(AppStrings.HIVE_FAVORITE_BOX_NAME);
    super.onInit();
  }

  @override
  Future<void> add(FavoriteMovie movie) async {
    var box =
        await Hive.openBox<FavoriteMovie>(AppStrings.HIVE_FAVORITE_BOX_NAME);
    await box.add(movie);
  }

  @override
  Future<void> remove(FavoriteMovie movie) async {
    var box =
        await Hive.openBox<FavoriteMovie>(AppStrings.HIVE_FAVORITE_BOX_NAME);
    await movie.delete();
  }

  @override
  Future<List<FavoriteMovie>> getAll() async {
    var box =
        await Hive.openBox<FavoriteMovie>(AppStrings.HIVE_FAVORITE_BOX_NAME);
    return box.values.toList();
  }

  @override
  Future<void> toggleFavorite(FavoriteMovie movie) async {
    var box =
        await Hive.openBox<FavoriteMovie>(AppStrings.HIVE_FAVORITE_BOX_NAME);
    movie.isFavorite = !movie.isFavorite;
    await movie.save();
  }
}
