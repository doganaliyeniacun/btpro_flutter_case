import 'package:btpro_flutter_case/src/features/home/view_model/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  late final IHomeViewModel vm;
  setUp(() {
    vm = Get.put(HomeViewModel());
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
