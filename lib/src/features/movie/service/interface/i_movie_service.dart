import 'package:get/get.dart';

import '../../model/movie.dart';

abstract class IMovieService {
  late final RxList<Movie> moviesList;
  Future<void> fetchMovies(String movieName);
}