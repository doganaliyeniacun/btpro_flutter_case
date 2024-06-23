import 'dart:io';

import 'package:btpro_flutter_case/src/features/movie/view_model/movie_view_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  late final IMovieViewModel vm;
  setUp(() {
    dotenv.testLoad(fileInput: File('.env').readAsStringSync());
    vm = Get.put(MovieViewModel());
  });

  test(
    'Movie list is not empty',
    () async {
      await vm.getMovies('blade');
      expect(vm.moviesList, isNotEmpty);
    },
  );

  test(
    'Movie not found',
    () async {
      await vm.getMovies('qweqwewqeqwe');
      expect(vm.moviesList.first.error, isNotEmpty);
    },
  );
}
